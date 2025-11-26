#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDirectManipulationViewport.ahk

/**
 * Provides management of behaviors on a viewport. A behavior affects the functionality of a particular part of the Direct Manipulation workflow.
 * @remarks
 * 
 * <b>IDirectManipulationViewport2</b> can be used in place of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewport">IDirectManipulationViewport</a>.
 * 
 * 
 * Behaviors are created using <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationmanager2">IDirectManipulationManager2</a> and an appropriate class ID.
 * 
 * A behavior can be attached or removed at any time and takes effect immediately (even during an active manipulation or inertia animation).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationviewport2
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationViewport2 extends IDirectManipulationViewport{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationViewport2
     * @type {Guid}
     */
    static IID => Guid("{923ccaac-61e1-4385-b726-017af189882a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 31

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddBehavior", "RemoveBehavior", "RemoveAllBehaviors"]

    /**
     * Adds a behavior to the viewport and returns a cookie to the caller.
     * @param {IUnknown} behavior A behavior created using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationmanager2-createbehavior">CreateBehavior</a> method.
     * @returns {Integer} A cookie is returned so the caller can remove this behavior later. This allows the caller to release any reference on the behavior and let <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> maintain an appropriate lifetime, similar to event handlers.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior
     */
    AddBehavior(behavior) {
        result := ComCall(31, this, "ptr", behavior, "uint*", &cookie := 0, "HRESULT")
        return cookie
    }

    /**
     * Removes a behavior from the viewport that matches the given cookie.
     * @param {Integer} cookie A valid cookie returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior">AddBehavior</a> call on the same viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code. If the behavior has already been removed or if the behavior is not attached to this viewport a failure is returned.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removebehavior
     */
    RemoveBehavior(cookie) {
        result := ComCall(32, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * Removes all behaviors added to the viewport.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removeallbehaviors
     */
    RemoveAllBehaviors() {
        result := ComCall(33, this, "HRESULT")
        return result
    }
}
