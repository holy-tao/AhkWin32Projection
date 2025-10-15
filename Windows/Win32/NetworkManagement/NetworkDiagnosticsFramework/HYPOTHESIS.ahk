#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class HYPOTHESIS extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszClassName{
        get {
            if(!this.HasProp("__pwszClassName"))
                this.__pwszClassName := PWSTR(this.ptr + 0)
            return this.__pwszClassName
        }
    }

    /**
     * @type {PWSTR}
     */
    pwszDescription{
        get {
            if(!this.HasProp("__pwszDescription"))
                this.__pwszDescription := PWSTR(this.ptr + 8)
            return this.__pwszDescription
        }
    }

    /**
     * @type {Integer}
     */
    celt {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<HELPER_ATTRIBUTE>}
     */
    rgAttributes {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
