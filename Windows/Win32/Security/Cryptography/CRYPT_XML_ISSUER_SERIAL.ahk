#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

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
     * @type {PWSTR}
     */
    wszIssuer{
        get {
            if(!this.HasProp("__wszIssuer"))
                this.__wszIssuer := PWSTR(this.ptr + 0)
            return this.__wszIssuer
        }
    }

    /**
     * A pointer to a null-terminated wide character string that contains the serial number of the certificate.
     * @type {PWSTR}
     */
    wszSerial{
        get {
            if(!this.HasProp("__wszSerial"))
                this.__wszSerial := PWSTR(this.ptr + 8)
            return this.__wszSerial
        }
    }
}
