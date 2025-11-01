#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/ndattrib/ns-ndattrib-shellcommandinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class ShellCommandInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszOperation {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    pwszFile {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PWSTR}
     */
    pwszParameters {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    pwszDirectory {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    nShowCmd {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
