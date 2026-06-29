#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains an X.509 issued distinguished name�serial number pair.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_issuer_serial
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_ISSUER_SERIAL {
    #StructPack 8

    /**
     * A pointer to a null-terminated wide character string that contains the issuer of the certificate.
     */
    wszIssuer : PWSTR

    /**
     * A pointer to a null-terminated wide character string that contains the serial number of the certificate.
     */
    wszSerial : PWSTR

}
