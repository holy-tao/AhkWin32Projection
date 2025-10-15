#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The ADS_OBJECT_INFO structure specifies the data, including the identity and location, of a directory service object.
 * @remarks
 * 
  * To obtain the object data, non-Automation clients call the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-idirectoryobject-getobjectinformation">IDirectoryObject::GetObjectInformation</a> method, which takes an out parameter, a pointer to an <b>ADS_OBJECT_INFO</b> structure allocated in the heap. Automation clients can accomplish the same task by calling  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nf-iads-iads-getinfo">IADs::GetInfo</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_object_info
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_OBJECT_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The null-terminated Unicode string that contains the relative distinguished name of the directory service object.
     * @type {PWSTR}
     */
    pszRDN{
        get {
            if(!this.HasProp("__pszRDN"))
                this.__pszRDN := PWSTR(this.ptr + 0)
            return this.__pszRDN
        }
    }

    /**
     * The null-terminated Unicode string that contains the distinguished name  of the directory service object.
     * @type {PWSTR}
     */
    pszObjectDN{
        get {
            if(!this.HasProp("__pszObjectDN"))
                this.__pszObjectDN := PWSTR(this.ptr + 8)
            return this.__pszObjectDN
        }
    }

    /**
     * The null-terminated Unicode string that contains the distinguished name of the parent object.
     * @type {PWSTR}
     */
    pszParentDN{
        get {
            if(!this.HasProp("__pszParentDN"))
                this.__pszParentDN := PWSTR(this.ptr + 16)
            return this.__pszParentDN
        }
    }

    /**
     * The null-terminated Unicode string that contains the distinguished name of the schema class of the object.
     * @type {PWSTR}
     */
    pszSchemaDN{
        get {
            if(!this.HasProp("__pszSchemaDN"))
                this.__pszSchemaDN := PWSTR(this.ptr + 24)
            return this.__pszSchemaDN
        }
    }

    /**
     * The null-terminated Unicode string that contains the name of the class of which this object is an instance.
     * @type {PWSTR}
     */
    pszClassName{
        get {
            if(!this.HasProp("__pszClassName"))
                this.__pszClassName := PWSTR(this.ptr + 32)
            return this.__pszClassName
        }
    }
}
