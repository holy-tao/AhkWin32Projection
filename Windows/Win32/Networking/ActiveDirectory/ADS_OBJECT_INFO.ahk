#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
    pszRDN {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The null-terminated Unicode string that contains the distinguished name  of the directory service object.
     * @type {PWSTR}
     */
    pszObjectDN {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The null-terminated Unicode string that contains the distinguished name of the parent object.
     * @type {PWSTR}
     */
    pszParentDN {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The null-terminated Unicode string that contains the distinguished name of the schema class of the object.
     * @type {PWSTR}
     */
    pszSchemaDN {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The null-terminated Unicode string that contains the name of the class of which this object is an instance.
     * @type {PWSTR}
     */
    pszClassName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
