#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_POLICY95_QUALIFIER1 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszPracticesReference{
        get {
            if(!this.HasProp("__pszPracticesReference"))
                this.__pszPracticesReference := PWSTR(this.ptr + 0)
            return this.__pszPracticesReference
        }
    }

    /**
     * @type {PSTR}
     */
    pszNoticeIdentifier{
        get {
            if(!this.HasProp("__pszNoticeIdentifier"))
                this.__pszNoticeIdentifier := PSTR(this.ptr + 8)
            return this.__pszNoticeIdentifier
        }
    }

    /**
     * @type {PSTR}
     */
    pszNSINoticeIdentifier{
        get {
            if(!this.HasProp("__pszNSINoticeIdentifier"))
                this.__pszNSINoticeIdentifier := PSTR(this.ptr + 16)
            return this.__pszNSINoticeIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    cCPSURLs {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Pointer<CPS_URLS>}
     */
    rgCPSURLs {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
