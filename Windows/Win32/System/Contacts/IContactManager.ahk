#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContact.ahk
#Include .\IContactCollection.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. Used for retrieving a contact, based on a contact ID string.
 * @see https://docs.microsoft.com/windows/win32/api//icontact/nn-icontact-icontactmanager
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactManager
     * @type {Guid}
     */
    static IID => Guid("{ad553d98-deb1-474a-8e17-fc0c2075b738}")

    /**
     * The class identifier for ContactManager
     * @type {Guid}
     */
    static CLSID => Guid("{7165c8ab-af88-42bd-86fd-5310b4285a02}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Load", "MergeContactIDs", "GetMeContact", "SetMeContact", "GetContactCollection"]

    /**
     * Initializes the contact manager with the unique application name and application version being used to manipulate contacts.
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
     * <a href="/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactmanager">IContactManager</a> is initialized. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactmanager-initialize
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
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactmanager-load
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
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactmanager-mergecontactids
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
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactmanager-getmecontact
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
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactmanager-setmecontact
     */
    SetMeContact(pMeContact) {
        result := ComCall(7, this, "ptr", pMeContact, "HRESULT")
        return result
    }

    /**
     * Returns an IContactCollection object that contains all known contacts.
     * @returns {IContactCollection} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontactcollection">IContactCollection</a>**</b>
     * 
     * On success, contains an enumeration of the contact collection.
     * @see https://docs.microsoft.com/windows/win32/api//icontact/nf-icontact-icontactmanager-getcontactcollection
     */
    GetContactCollection() {
        result := ComCall(8, this, "ptr*", &ppContactCollection := 0, "HRESULT")
        return IContactCollection(ppContactCollection)
    }
}
