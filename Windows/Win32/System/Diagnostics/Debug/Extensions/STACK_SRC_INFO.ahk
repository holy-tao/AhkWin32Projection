#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 * @version v4.0.30319
 */
class STACK_SRC_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    ImagePath{
        get {
            if(!this.HasProp("__ImagePath"))
                this.__ImagePath := PWSTR(this.ptr + 0)
            return this.__ImagePath
        }
    }

    /**
     * @type {PWSTR}
     */
    ModuleName{
        get {
            if(!this.HasProp("__ModuleName"))
                this.__ModuleName := PWSTR(this.ptr + 8)
            return this.__ModuleName
        }
    }

    /**
     * @type {PWSTR}
     */
    Function{
        get {
            if(!this.HasProp("__Function"))
                this.__Function := PWSTR(this.ptr + 16)
            return this.__Function
        }
    }

    /**
     * @type {Integer}
     */
    Displacement {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Row {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Column {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
