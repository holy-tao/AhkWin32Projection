#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ole\ARRAYDESC.ahk" { ARRAYDESC }
#Import ".\ELEMDESC.ahk" { ELEMDESC }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import ".\IDLFLAGS.ahk" { IDLFLAGS }
#Import ".\VARKIND.ahk" { VARKIND }
#Import ".\VARFLAGS.ahk" { VARFLAGS }
#Import ".\TYPEDESC.ahk" { TYPEDESC }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Ole\PARAMFLAGS.ahk" { PARAMFLAGS }
#Import "..\Ole\PARAMDESC.ahk" { PARAMDESC }
#Import "..\Ole\PARAMDESCEX.ahk" { PARAMDESCEX }
#Import ".\IDLDESC.ahk" { IDLDESC }

/**
 * Describes a variable, constant, or data member.
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-vardesc
 * @namespace Windows.Win32.System.Com
 */
export default struct VARDESC {
    #StructPack 8

    /**
     * The member ID.
     */
    memid : Int32

    /**
     * Reserved.
     */
    lpstrSchema : PWSTR

    oInst : UInt32

    /**
     * The variable type.
     */
    elemdescVar : ELEMDESC

    /**
     * The variable flags. See <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ne-oaidl-varflags">VARFLAGS</a>.
     */
    wVarFlags : VARFLAGS

    /**
     * The variable type.
     */
    varkind : VARKIND

    static __New() {
        DefineProp(this.Prototype, 'lpvarValue', { type: VARIANT.Ptr, offset: 16 })
        this.DeleteProp("__New")
    }
}
