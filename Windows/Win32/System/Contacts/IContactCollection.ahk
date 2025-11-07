#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IContact.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Do not use. Enumerates the contacts known by the IContactManager.
 * @remarks
 * 
 * This interface does not support deletion of contacts during an enumeration. Adding or removing contacts by other means during an enumeration results in undefined behavior. Modifying contact properties during enumeration is allowed.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//icontact/nn-icontact-icontactcollection
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContactCollection
     * @type {Guid}
     */
    static IID => Guid("{b6afa338-d779-11d9-8bde-f66bad1e3f3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "Next", "GetCurrent"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactcollection-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactcollection-next
     */
    Next() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IContact} 
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactcollection-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &ppContact := 0, "HRESULT")
        return IContact(ppContact)
    }
}
