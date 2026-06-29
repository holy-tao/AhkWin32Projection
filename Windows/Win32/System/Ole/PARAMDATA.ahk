#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Variant\VARENUM.ahk" { VARENUM }

/**
 * Describes a parameter accepted by a method or property.
 * @see https://learn.microsoft.com/windows/win32/api/oleauto/ns-oleauto-paramdata
 * @namespace Windows.Win32.System.Ole
 */
export default struct PARAMDATA {
    #StructPack 8

    /**
     * The parameter name. Names should follow standard conventions for programming language access; that is, no embedded spaces or control characters, and 32 or fewer characters. The name should be localized because each type description provides names for a particular locale.
     */
    szName : PWSTR

    /**
     * The parameter type. If more than one parameter type is accepted, VT_VARIANT should be specified.
     */
    vt : VARENUM

}
