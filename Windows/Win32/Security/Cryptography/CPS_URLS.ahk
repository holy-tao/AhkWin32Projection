#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CPS_URLS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pszURL{
        get {
            if(!this.HasProp("__pszURL"))
                this.__pszURL := PWSTR(this.ptr + 0)
            return this.__pszURL
        }
    }

    /**
     * @type {Pointer<CRYPT_ALGORITHM_IDENTIFIER>}
     */
    pAlgorithm {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CRYPT_INTEGER_BLOB>}
     */
    pDigest {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
