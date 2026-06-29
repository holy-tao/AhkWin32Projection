#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The ADS_OBJECT_INFO structure specifies the data, including the identity and location, of a directory service object.
 * @remarks
 * To obtain the object data, non-Automation clients call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectoryobject-getobjectinformation">IDirectoryObject::GetObjectInformation</a> method, which takes an out parameter, a pointer to an <b>ADS_OBJECT_INFO</b> structure allocated in the heap. Automation clients can accomplish the same task by calling  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a>.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_object_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_OBJECT_INFO {
    #StructPack 8

    /**
     * The null-terminated Unicode string that contains the relative distinguished name of the directory service object.
     */
    pszRDN : PWSTR

    /**
     * The null-terminated Unicode string that contains the distinguished name  of the directory service object.
     */
    pszObjectDN : PWSTR

    /**
     * The null-terminated Unicode string that contains the distinguished name of the parent object.
     */
    pszParentDN : PWSTR

    /**
     * The null-terminated Unicode string that contains the distinguished name of the schema class of the object.
     */
    pszSchemaDN : PWSTR

    /**
     * The null-terminated Unicode string that contains the name of the class of which this object is an instance.
     */
    pszClassName : PWSTR

}
