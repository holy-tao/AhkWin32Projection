#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a service for managing associations between a contact and a viewport.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationdefercontactservice
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationDeferContactService extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationDeferContactService
     * @type {Guid}
     */
    static IID := Guid("{652d5c71-fe60-4a98-be70-e5f21291e7f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationDeferContactService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DeferContact   : IntPtr
        CancelContact  : IntPtr
        CancelDeferral : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationDeferContactService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies the amount of time to defer the execution of a call to SetContact for this pointerId.
     * @param {Integer} pointerId The ID of the pointer.
     * @param {Integer} timeout The duration of the deferral, in milliseconds. The maximum value is 500.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-defercontact
     */
    DeferContact(pointerId, timeout) {
        result := ComCall(3, this, "uint", pointerId, "uint", timeout, "HRESULT")
        return result
    }

    /**
     * Cancel all scheduled calls to SetContact for this pointerId.
     * @remarks
     * This function fails if the timeout specified in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-defercontact">DeferContact</a> has already been reached.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-cancelcontact
     */
    CancelContact(pointerId) {
        result := ComCall(4, this, "uint", pointerId, "HRESULT")
        return result
    }

    /**
     * Cancel the deferral set in DeferContact and process the scheduled SetContact call for this pointerId.
     * @param {Integer} pointerId The ID of the pointer.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdefercontactservice-canceldeferral
     */
    CancelDeferral(pointerId) {
        result := ComCall(5, this, "uint", pointerId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationDeferContactService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DeferContact := CallbackCreate(GetMethod(implObj, "DeferContact"), flags, 3)
        this.vtbl.CancelContact := CallbackCreate(GetMethod(implObj, "CancelContact"), flags, 2)
        this.vtbl.CancelDeferral := CallbackCreate(GetMethod(implObj, "CancelDeferral"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DeferContact)
        CallbackFree(this.vtbl.CancelContact)
        CallbackFree(this.vtbl.CancelDeferral)
    }
}
