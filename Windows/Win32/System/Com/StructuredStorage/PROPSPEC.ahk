#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\PROPSPEC_KIND.ahk" { PROPSPEC_KIND }

/**
 * The PROPSPEC structure is used by many of the methods of IPropertyStorage to specify a property either by its property identifier (ID) or the associated string name.
 * @remarks
 * String names are optional and can be assigned to a set of properties when the property is created with a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writemultiple">IPropertyStorage::WriteMultiple</a> or later with a call to <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-writepropertynames">IPropertyStorage::WritePropertyNames</a>.
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-propspec
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PROPSPEC {
    #StructPack 8

    ulKind : PROPSPEC_KIND

    propid : UInt32

    static __New() {
        DefineProp(this.Prototype, 'lpwstr', { type: PWSTR, offset: 8 })
        this.DeleteProp("__New")
    }
}
