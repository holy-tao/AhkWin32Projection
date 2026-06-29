#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDLDESC.ahk" { IDLDESC }
#Import "..\Ole\PARAMFLAGS.ahk" { PARAMFLAGS }
#Import "..\Ole\PARAMDESCEX.ahk" { PARAMDESCEX }
#Import ".\IDLFLAGS.ahk" { IDLFLAGS }
#Import "..\Variant\VARENUM.ahk" { VARENUM }
#Import ".\TYPEDESC.ahk" { TYPEDESC }
#Import "..\Ole\PARAMDESC.ahk" { PARAMDESC }
#Import "..\Ole\ARRAYDESC.ahk" { ARRAYDESC }

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
