#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IContact.ahk" { IContact }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Do not use. Enumerates the contacts known by the IContactManager.
 * @remarks
 * This interface does not support deletion of contacts during an enumeration. Adding or removing contacts by other means during an enumeration results in undefined behavior. Modifying contact properties during enumeration is allowed.
 * @see https://learn.microsoft.com/windows/win32/api/icontact/nn-icontact-icontactcollection
 * @namespace Windows.Win32.System.Contacts
 */
export default struct IContactCollection extends IUnknown {
    /**
     * The interface identifier for IContactCollection
     * @type {Guid}
     */
    static IID := Guid("{b6afa338-d779-11d9-8bde-f66bad1e3f3a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContactCollection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Reset      : IntPtr
        Next       : IntPtr
        GetCurrent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContactCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resets the enumerator to before the logical first element.
     * @remarks
     * A call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactcollection-getcurrent">IContactCollection::GetCurrent</a> immediately after <b>IContactCollection::Reset</b> is undefined. To get the first contact, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactcollection-next">IContactCollection::Next</a> first to ensure that there is one.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactcollection-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Moves to the next contact.
     * @remarks
     * After S_FALSE is returned, calls to GetCurrent will fail.
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
     * Move is successful. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not move, positioned at the end of the collection. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactcollection-next
     */
    Next() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the current contact in the enumeration.
     * @remarks
     * After reset, a call to <b>IContactCollection::GetCurrent</b> without first calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nf-icontact-icontactcollection-next">IContactCollection::Next</a> will fail.
     * @returns {IContact} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/icontact/nn-icontact-icontact">IContact</a>**</b>
     * 
     * If successful, contains the current contact.
     * @see https://learn.microsoft.com/windows/win32/api/icontact/nf-icontact-icontactcollection-getcurrent
     */
    GetCurrent() {
        result := ComCall(5, this, "ptr*", &ppContact := 0, "HRESULT")
        return IContact(ppContact)
    }

    Query(iid) {
        if (IContactCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Next := CallbackCreate(GetMethod(implObj, "Next"), flags, 1)
        this.vtbl.GetCurrent := CallbackCreate(GetMethod(implObj, "GetCurrent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Next)
        CallbackFree(this.vtbl.GetCurrent)
    }
}
