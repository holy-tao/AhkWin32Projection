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
     * 
     * @param {IUnknown} behavior 
     * @param {Pointer<Integer>} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-addbehavior
     */
    AddBehavior(behavior, cookie) {
        cookieMarshal := cookie is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "ptr", behavior, cookieMarshal, cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removebehavior
     */
    RemoveBehavior(cookie) {
        result := ComCall(32, this, "uint", cookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport2-removeallbehaviors
     */
    RemoveAllBehaviors() {
        result := ComCall(33, this, "HRESULT")
        return result
    }
}
