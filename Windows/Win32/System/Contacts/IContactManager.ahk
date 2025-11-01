#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {PWSTR} pszAppName 
     * @param {PWSTR} pszAppVersion 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pszAppName, pszAppVersion) {
        pszAppName := pszAppName is String ? StrPtr(pszAppName) : pszAppName
        pszAppVersion := pszAppVersion is String ? StrPtr(pszAppVersion) : pszAppVersion

        result := ComCall(3, this, "ptr", pszAppName, "ptr", pszAppVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszContactID 
     * @param {Pointer<IContact>} ppContact 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-load
     */
    Load(pszContactID, ppContact) {
        pszContactID := pszContactID is String ? StrPtr(pszContactID) : pszContactID

        result := ComCall(4, this, "ptr", pszContactID, "ptr*", ppContact, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszNewContactID 
     * @param {PWSTR} pszOldContactID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-mergecontactids
     */
    MergeContactIDs(pszNewContactID, pszOldContactID) {
        pszNewContactID := pszNewContactID is String ? StrPtr(pszNewContactID) : pszNewContactID
        pszOldContactID := pszOldContactID is String ? StrPtr(pszOldContactID) : pszOldContactID

        result := ComCall(5, this, "ptr", pszNewContactID, "ptr", pszOldContactID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IContact>} ppMeContact 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-getmecontact
     */
    GetMeContact(ppMeContact) {
        result := ComCall(6, this, "ptr*", ppMeContact, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IContact} pMeContact 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-setmecontact
     */
    SetMeContact(pMeContact) {
        result := ComCall(7, this, "ptr", pMeContact, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IContactCollection>} ppContactCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactmanager-getcontactcollection
     */
    GetContactCollection(ppContactCollection) {
        result := ComCall(8, this, "ptr*", ppContactCollection, "HRESULT")
        return result
    }
}
