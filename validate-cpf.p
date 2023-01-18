
/*------------------------------------------------------------------------
    File        : validate-cpf.p
    Description : Validate CPF with verification digit
    Author(s)   : Lucas Bicalho
    Created     : Wed Jan 18 10:10:02 BRST 2023
    Notes       : Adapted from https://www.devmedia.com.br/validar-cpf-com-javascript/23916
                  Explanation about the CPF calculus methodology http://www.cadcobol.com.br/calcula_cpf_cnpj_caepf.htm
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */

FUNCTION ValidateCPF RETURNS LOGICAL (INPUT pInput AS CHARACTER).
    DEFINE VARIABLE cleanInput AS CHARACTER NO-UNDO.
    DEFINE VARIABLE i          AS INTEGER   NO-UNDO.
    DEFINE VARIABLE sum1       AS INTEGER   NO-UNDO.
    DEFINE VARIABLE rem1       AS INTEGER   NO-UNDO.
    DEFINE VARIABLE rem2       AS INTEGER   NO-UNDO.
    
    cleanInput = REPLACE(REPLACE(pInput, ".", ""), "-", "").
    
    // First verification digit
    // Iteration and multiplication
    DO i = 1 TO 9:
        sum1 = sum1 + INTEGER(SUBSTRING(cleanInput, i, 1)) * (11 - i).
    END.
    // Remainder
    rem1 = (sum1 * 10) MODULO 11.
    rem1 = (IF rem1 = 10 OR rem1 = 11 THEN 0 ELSE rem1).
    IF rem1 <> INTEGER(SUBSTRING(cleanInput, 10, 1)) THEN RETURN FALSE.
    
    // Second verification digit
    // Iteration and multiplication
    sum1 = 0.
    DO i = 1 TO 10:
        sum1 = sum1 + INTEGER(SUBSTRING(cleanInput, i, 1)) * (12 - i).
    END.
    // Remainder
    rem2 = (sum1 * 10) MODULO 11.
    rem2 = (IF rem2 = 10 OR rem2 = 11 THEN 0 ELSE rem2).
    IF rem2 <> INTEGER(SUBSTRING(cleanInput, 11, 1)) THEN RETURN FALSE.
    
    RETURN TRUE.

END FUNCTION.

DISPLAY ValidateCPF("650.896.010-54").
DISPLAY ValidateCPF("650.896.010-51").
DISPLAY ValidateCPF("65089601054").
DISPLAY ValidateCPF("65089601051").
