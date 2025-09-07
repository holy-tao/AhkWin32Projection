#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SecPkgContext_ConnectionInfoEx extends Win32Struct
{
    static sizeof => 404

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwProtocol {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {String}
     */
    szCipher {
        get => StrGet(this.ptr + 8, 63, "UTF-16")
        set => StrPut(value, this.ptr + 8, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwCipherStrength {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {String}
     */
    szHash {
        get => StrGet(this.ptr + 140, 63, "UTF-16")
        set => StrPut(value, this.ptr + 140, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwHashStrength {
        get => NumGet(this, 268, "uint")
        set => NumPut("uint", value, this, 268)
    }

    /**
     * @type {String}
     */
    szExchange {
        get => StrGet(this.ptr + 272, 63, "UTF-16")
        set => StrPut(value, this.ptr + 272, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwExchStrength {
        get => NumGet(this, 400, "uint")
        set => NumPut("uint", value, this, 400)
    }
}
