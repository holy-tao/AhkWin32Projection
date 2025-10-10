#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an X.509 issued distinguished name�serial number pair.
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ns-cryptxml-crypt_xml_issuer_serial
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_ISSUER_SERIAL extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * A pointer to a null-terminated wide character string that contains the issuer of the certificate.
     * @type {Pointer<Char>}
     */
    wszIssuer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * A pointer to a null-terminated wide character string that contains the serial number of the certificate.
     * @type {Pointer<Char>}
     */
    wszSerial {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
