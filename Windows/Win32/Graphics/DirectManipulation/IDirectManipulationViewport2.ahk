#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectManipulationViewport.ahk" { IDirectManipulationViewport }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides management of behaviors on a viewport. A behavior affects the functionality of a particular part of the Direct Manipulation workflow.
 * @remarks
 * <b>IDirectManipulationViewport2</b> can be used in place of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewport">IDirectManipulationViewport</a>.
 * 
 * 
 * Behaviors are created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationmanager2">IDirectManipulationManager2</a> and an appropriate class ID.
 * 
 * A behavior can be attached or removed at any time and takes effect immediately (even during an active manipulation or inertia animation).
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewport2
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationViewport2 extends IDirectManipulationViewport {
    /**
     * The interface identifier for IDirectManipulationViewport2
     * @type {Guid}
     */
    static IID := Guid("{923ccaac-61e1-4385-b726-017af189882a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationViewport2 interfaces
    */
    struct Vtbl extends IDirectManipulationViewport.Vtbl {
        AddBehavior        : IntPtr
        RemoveBehavior     : IntPtr
        RemoveAllBehaviors : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationViewport2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Adds a behavior to the viewport and returns a cookie to the caller.
     * @remarks
     * A behavior takes effect immediately after <b>AddBehavior</b> is called. This must be considered when adding a behavior during an active manipulation or inertia phase.
     * @param {IUnknown} behavior A behavior created using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager2-createbehavior">CreateBehavior</a> method.
     * @returns {Integer} A cookie is returned so the caller can remove this behavior later. This allows the caller to release any reference on the behavior and let <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> maintain an appropriate lifetime, similar to event handlers.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior
     */
    AddBehavior(behavior) {
        result := ComCall(31, this, "ptr", behavior, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * Removes a behavior from the viewport that matches the given cookie.
     * @param {Integer} cookie A valid cookie returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior">AddBehavior</a> call on the same viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. If the behavior has already been removed or if the behavior is not attached to this viewport a failure is returned.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removebehavior
     */
    RemoveBehavior(cookie) {
        result := ComCall(32, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Removes all behaviors added to the viewport.
     * @remarks
     * <b>RemoveAllBehaviors</b> only returns an error if the removal of a behavior from the viewport was unsuccessful. In the event that a specific behavior is not removed successfully, <b>RemoveAllBehaviors</b> removes all remaining behaviors.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removeallbehaviors
     */
    RemoveAllBehaviors() {
        result := ComCall(33, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationViewport2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddBehavior := CallbackCreate(GetMethod(implObj, "AddBehavior"), flags, 3)
        this.vtbl.RemoveBehavior := CallbackCreate(GetMethod(implObj, "RemoveBehavior"), flags, 2)
        this.vtbl.RemoveAllBehaviors := CallbackCreate(GetMethod(implObj, "RemoveAllBehaviors"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddBehavior)
        CallbackFree(this.vtbl.RemoveBehavior)
        CallbackFree(this.vtbl.RemoveAllBehaviors)
    }
}
