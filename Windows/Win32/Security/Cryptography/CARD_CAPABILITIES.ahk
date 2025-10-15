#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CARD_CAPABILITIES extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    fCertificateCompression{
        get {
            if(!this.HasProp("__fCertificateCompression"))
                this.__fCertificateCompression := BOOL(this.ptr + 4)
            return this.__fCertificateCompression
        }
    }

    /**
     * @type {BOOL}
     */
    fKeyGen{
        get {
            if(!this.HasProp("__fKeyGen"))
                this.__fKeyGen := BOOL(this.ptr + 8)
            return this.__fKeyGen
        }
    }
}
