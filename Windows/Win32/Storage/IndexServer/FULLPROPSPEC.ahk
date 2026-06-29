#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\StructuredStorage\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPSPEC.ahk" { PROPSPEC }

/**
 * Specifies a property set and a property within the property set.
 * @see https://learn.microsoft.com/windows/win32/api/filter/ns-filter-fullpropspec
 * @namespace Windows.Win32.Storage.IndexServer
 */
export default struct FULLPROPSPEC {
    #StructPack 8

    /**
     * The globally unique identifier (GUID) that identifies the property set.
     */
    guidPropSet : Guid

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propspec">PROPSPEC</a> structure that specifies a property either by its property identifier (propid) or by the associated string name (<b>lpwstr</b>).
     */
    psProperty : PROPSPEC

}
