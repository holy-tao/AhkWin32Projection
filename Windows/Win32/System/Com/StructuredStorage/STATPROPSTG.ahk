#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Variant\VARENUM.ahk" { VARENUM }

/**
 * The STATPROPSTG structure contains data about a single property in a property set. This data is the property ID and type tag, and the optional string name that may be associated with the property.
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-statpropstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct STATPROPSTG {
    #StructPack 8

    /**
     * A wide-character null-terminated Unicode string that contains the optional string name associated with the property. May be <b>NULL</b>. This member must be freed using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     */
    lpwstrName : PWSTR

    /**
     * A 32-bit identifier that uniquely identifies the property within the property set. All properties within property sets must have unique property identifiers.
     */
    propid : UInt32

    /**
     * The property type.
     */
    vt : VARENUM

}
