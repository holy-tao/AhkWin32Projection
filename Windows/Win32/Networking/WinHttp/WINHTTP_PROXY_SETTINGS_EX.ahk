#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS_EX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ullGenerationId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszAutoconfigUrl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszProxy {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszSecureProxy {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cProxyBypasses {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<Char>}
     */
    rgpcwszProxyBypasses {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    dwInterfaceIndex {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Pointer<Char>}
     */
    pcwszConnectionName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
