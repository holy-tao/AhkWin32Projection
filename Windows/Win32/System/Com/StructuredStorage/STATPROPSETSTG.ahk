#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The STATPROPSETSTG structure contains information about a property set. (STATPROPSETSTG structure)
 * @see https://learn.microsoft.com/windows/win32/api/propidlbase/ns-propidlbase-statpropsetstg
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct STATPROPSETSTG {
    #StructPack 4

    /**
     * FMTID of the current property set, specified when the property set was initially created.
     */
    fmtid : Guid

    /**
     * <b>CLSID</b> associated with this property set, specified when the property set was initially created and possibly modified thereafter with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertystorage-setclass">IPropertyStorage::SetClass</a>. If not set, the value will be <b>CLSID_NULL</b>.
     */
    clsid : Guid

    /**
     * Flag values of the property set, as specified in 
     * <a href="https://docs.microsoft.com/windows/desktop/api/propidl/nf-propidl-ipropertysetstorage-create">IPropertySetStorage::Create</a>.
     */
    grfFlags : UInt32

    /**
     * Time in Universal Coordinated Time (UTC) when the property set was last modified.
     */
    mtime : FILETIME

    /**
     * Time in UTC when this property set was created.
     */
    ctime : FILETIME

    /**
     * Time in UTC when this property set was last accessed.
     */
    atime : FILETIME

    dwOSVersion : UInt32

}
