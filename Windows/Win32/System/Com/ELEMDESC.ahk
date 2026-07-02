#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ole\ARRAYDESC.ahk" { ARRAYDESC }
#Import ".\TYPEDESC.ahk" { TYPEDESC }
#Import "..\Ole\PARAMDESC.ahk" { PARAMDESC }
#Import ".\IDLFLAGS.ahk" { IDLFLAGS }
#Import "..\Ole\PARAMFLAGS.ahk" { PARAMFLAGS }
#Import ".\IDLDESC.ahk" { IDLDESC }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import "..\Ole\PARAMDESCEX.ahk" { PARAMDESCEX }

/**
 * The ELEMDESC structure contains the type description and process-transfer information for a variable, a function, or a function parameter. (ELEMDESC)
 * @see https://learn.microsoft.com/windows/win32/api/oaidl/ns-oaidl-elemdesc~r1
 * @namespace Windows.Win32.System.Com
 */
export default struct ELEMDESC {
    #StructPack 8

    /**
     * The type of the element.
     */
    tdesc : TYPEDESC

    idldesc : IDLDESC

    static __New() {
        DefineProp(this.Prototype, 'paramdesc', { type: PARAMDESC, offset: 16 })
        this.DeleteProp("__New")
    }
}
