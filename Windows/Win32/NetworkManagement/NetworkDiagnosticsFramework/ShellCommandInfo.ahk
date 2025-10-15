#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
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
    pwszOperation{
        get {
            if(!this.HasProp("__pwszOperation"))
                this.__pwszOperation := PWSTR(this.ptr + 0)
            return this.__pwszOperation
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszFile{
        get {
            if(!this.HasProp("__pwszFile"))
                this.__pwszFile := PWSTR(this.ptr + 8)
            return this.__pwszFile
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszParameters{
        get {
            if(!this.HasProp("__pwszParameters"))
                this.__pwszParameters := PWSTR(this.ptr + 16)
            return this.__pwszParameters
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszDirectory{
        get {
            if(!this.HasProp("__pwszDirectory"))
                this.__pwszDirectory := PWSTR(this.ptr + 24)
            return this.__pwszDirectory
        }
    }

    /**
     * @type {Integer}
     */
    nShowCmd {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
