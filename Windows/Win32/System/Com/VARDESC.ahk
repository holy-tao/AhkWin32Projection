#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\TYPEDESC.ahk
#Include .\IDLDESC.ahk
#Include ..\Ole\PARAMDESC.ahk
#Include .\ELEMDESC.ahk

/**
 * Describes a variable, constant, or data member.
 * @see https://docs.microsoft.com/windows/win32/api//oaidl/ns-oaidl-vardesc
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class VARDESC extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The member ID.
     * @type {Integer}
     */
    memid {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Reserved.
     * @type {PWSTR}
     */
    lpstrSchema{
        get {
            if(!this.HasProp("__lpstrSchema"))
                this.__lpstrSchema := PWSTR(this.ptr + 8)
            return this.__lpstrSchema
        }
    }

    /**
     * @type {Integer}
     */
    oInst {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer<VARIANT>}
     */
    lpvarValue {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The variable type.
     * @type {ELEMDESC}
     */
    elemdescVar{
        get {
            if(!this.HasProp("__elemdescVar"))
                this.__elemdescVar := ELEMDESC(this.ptr + 24)
            return this.__elemdescVar
        }
    }

    /**
     * The variable flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-varflags">VARFLAGS</a>.
     * @type {Integer}
     */
    wVarFlags {
        get => NumGet(this, 56, "ushort")
        set => NumPut("ushort", value, this, 56)
    }

    /**
     * The variable type.
     * @type {Integer}
     */
    varkind {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }
}
