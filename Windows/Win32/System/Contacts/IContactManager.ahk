#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IContact.ahk" { IContact }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IContactCollection.ahk" { IContactCollection }

/**
 * Do not use. Used for retrieving a contact, based on a contact ID string.
 * @see https://learn.microsoft.com/windows/win32/api/icontact/nn-icontact-icontactmanager
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactManager extends IUnknown {
    /**
     * The interface identifier for IContactManager
     * @type {Guid}
     */
    static IID := Guid("{ad553d98-deb1-474a-8e17-fc0c2075b738}")

    /**
     * The class identifier for ContactManager
     * @type {Guid}
     */
    static CLSID := Guid("{7165c8ab-af88-42bd-86fd-5310b4285a02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize           : IntPtr
        Load                 : IntPtr
        MergeContactIDs      : IntPtr
        GetMeContact         : IntPtr
        SetMeContact         : IntPtr
        GetContactCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the contact manager with the unique application name and application version being used to manipulate contacts.
     * @remarks
     * <div class="alert"><b>Note</b>  This method MUST be called before other <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactmanager">IContactManager</a> methods.</div>
     * <div> </div>
     * @param {PWSTR} pszAppName Type: <b>LPWSTR</b>
     * 
     * Specifies the application name.
     * @param {PWSTR} pszAppVersion Type: <b>LPCWSTR</b>
     * 
     * Specifies the application version.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactmanager">IContactManager</a> is initialized. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-initialize
     */
    Initialize(pszAppName, pszAppVersion) {
        pszAppName := pszAppName is String ? StrPtr(pszAppName) : pszAppName
        pszAppVersion := pszAppVersion is String ? StrPtr(pszAppVersion) : pszAppVersion

        result := ComCall(3, this, "ptr", pszAppName, "ptr", pszAppVersion, "HRESULT")
        return result
    }

    /**
     * Loads an IContact object with the data from the contact referenced by the computer-local contact ID.
     * @param {PWSTR} pszContactID Type: <b>LPCWSTR</b>
     * 
     * Specifies the contact ID to load.
     * @returns {IContact} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontact">IContact</a>**</b>
     * 
     * Specifies the destination <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontact">IContact</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-load
     */
    Load(pszContactID) {
        pszContactID := pszContactID is String ? StrPtr(pszContactID) : pszContactID

        result := ComCall(4, this, "ptr", pszContactID, "ptr*", &ppContact := 0, "HRESULT")
        return IContact(ppContact)
    }

    /**
     * Makes an old Contact ID resolve to the same value as a new Contact ID. Subsequent calls to IContactManager::Load with the old contact ID now loads the new contact ID contact.
     * @param {PWSTR} pszNewContactID Type: <b>LPWSTR</b>
     * 
     * Specifies the ID of the new contact, representing both the old and new contacts.
     * @param {PWSTR} pszOldContactID Type: <b>LPCWSTR</b>
     * 
     * Specifies the ID representing the old contact.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Address change was successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-mergecontactids
     */
    MergeContactIDs(pszNewContactID, pszOldContactID) {
        pszNewContactID := pszNewContactID is String ? StrPtr(pszNewContactID) : pszNewContactID
        pszOldContactID := pszOldContactID is String ? StrPtr(pszOldContactID) : pszOldContactID

        result := ComCall(5, this, "ptr", pszNewContactID, "ptr", pszOldContactID, "HRESULT")
        return result
    }

    /**
     * Retrieves the local user account concept of 'me'.
     * @returns {IContact} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontact">IContact</a>**</b>
     * 
     * Specifies where to store a pointer to the 'me' contact.
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-getmecontact
     */
    GetMeContact() {
        result := ComCall(6, this, "ptr*", &ppMeContact := 0, "HRESULT")
        return IContact(ppMeContact)
    }

    /**
     * Sets the local user account concept of 'me' to specified user.
     * @param {IContact} pMeContact Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontact">IContact</a>*</b>
     * 
     * Specifies the contact to treat as 'me' for the current user.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns one of the following values:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Specification was successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-setmecontact
     */
    SetMeContact(pMeContact) {
        result := ComCall(7, this, "ptr", pMeContact, "HRESULT")
        return result
    }

    /**
     * Returns an IContactCollection object that contains all known contacts.
     * @remarks
     * The enumerator of the new collection is set before the first contact. You must first call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactcollection-next">Next</a> before querying the collection with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactcollection-getcurrent">GetCurrent</a>.
     * @returns {IContactCollection} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactcollection">IContactCollection</a>**</b>
     * 
     * On success, contains an enumeration of the contact collection.
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-getcontactcollection
     */
    GetContactCollection() {
        result := ComCall(8, this, "ptr*", &ppContactCollection := 0, "HRESULT")
        return IContactCollection(ppContactCollection)
    }

    Query(iid) {
        if (IContactManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 3)
        this.vtbl.MergeContactIDs := CallbackCreate(GetMethod(implObj, "MergeContactIDs"), flags, 3)
        this.vtbl.GetMeContact := CallbackCreate(GetMethod(implObj, "GetMeContact"), flags, 2)
        this.vtbl.SetMeContact := CallbackCreate(GetMethod(implObj, "SetMeContact"), flags, 2)
        this.vtbl.GetContactCollection := CallbackCreate(GetMethod(implObj, "GetContactCollection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.MergeContactIDs)
        CallbackFree(this.vtbl.GetMeContact)
        CallbackFree(this.vtbl.SetMeContact)
        CallbackFree(this.vtbl.GetContactCollection)
    }
}
