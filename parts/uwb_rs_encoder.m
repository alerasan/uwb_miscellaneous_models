function [ binary_outp_data ] = uwb_rs_encoder(binary_inp_data)

uwb_rs_enc = create_rs_enc();

if (length(binary_inp_data) > uwb_rs_enc.MessageLength * 6) % 330
    error( 'Error in uwb_rs_encoder: please set up length of binary input data less then 330 bits! ' );
end

[binary_inp_data, dummy_bits_length] = add_dummy_bits(binary_inp_data);

symbol_inp_data = convert_to_symbols(binary_inp_data);
    
enc_outp = step(uwb_rs_enc, symbol_inp_data);

binary_outp_data = convert_to_bits(enc_outp);

binary_outp_data = remove_dummy_bits(binary_outp_data, dummy_bits_length);

release(uwb_rs_enc);
reset(uwb_rs_enc);
end

function [uwb_rs_enc] = create_rs_enc()
    uwb_rs_enc = comm.RSEncoder;

    uwb_rs_enc.GeneratorPolynomialSource = 'Property'; 
    uwb_rs_enc.GeneratorPolynomial = 'X^8 + 55*X^7 + 61*x^6 + 37*x^5 + 48*x^4 + 47*x^3 + 20*x^2 + 6^x + 22';
    uwb_rs_enc.PrimitivePolynomialSource = 'Property';
    uwb_rs_enc.PrimitivePolynomial = 'x^6 + x + 1';

    uwb_rs_enc.CodewordLength = 63;
    uwb_rs_enc.MessageLength = 55;
end

function [binary_out_data, dummy_bits_length] = add_dummy_bits(binary_inp_data)
    if length(binary_inp_data) < 330
        dummy_bits_length = 330 - length(binary_inp_data);
        binary_out_data = [zeros(dummy_bits_length, 1); binary_inp_data];
    end
end

function [symbol_inp_data] = convert_to_symbols(binary_inp_data)
    symbol_inp_data = bi2de(reshape(binary_inp_data, 6, 55).', 'left-msb');
end

function [binary_outp_data]= convert_to_bits(symbol_outp_data)
	binary_outp_data = reshape(de2bi(symbol_outp_data), 1, 63*6);
end

function [binary_outp_data] = remove_dummy_bits(binary_inp_data, dummy_bits_length)
    binary_outp_data = binary_inp_data(1 + dummy_bits_length : end);
end
