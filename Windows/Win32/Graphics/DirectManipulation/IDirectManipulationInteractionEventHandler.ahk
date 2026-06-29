#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DIRECTMANIPULATION_INTERACTION_TYPE.ahk" { DIRECTMANIPULATION_INTERACTION_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectManipulationViewport2.ahk" { IDirectManipulationViewport2 }

/**
 * Defines methods to handle interactions when they are detected.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationinteractioneventhandler
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationInteractionEventHandler extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationInteractionEventHandler
     * @type {Guid}
     */
    static IID := Guid("{e43f45b8-42b4-403e-b1f2-273b8f510830}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationInteractionEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnInteraction : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationInteractionEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when an interaction is detected.
     * @param {IDirectManipulationViewport2} viewport The viewport on which the interaction was detected.
     * @param {DIRECTMANIPULATION_INTERACTION_TYPE} interaction One of the values from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_interaction_type">DIRECTMANIPULATION_INTERACTION_TYPE</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationinteractioneventhandler-oninteraction
     */
    OnInteraction(viewport, interaction) {
        result := ComCall(3, this, "ptr", viewport, DIRECTMANIPULATION_INTERACTION_TYPE, interaction, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationInteractionEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnInteraction := CallbackCreate(GetMethod(implObj, "OnInteraction"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnInteraction)
    }
}
