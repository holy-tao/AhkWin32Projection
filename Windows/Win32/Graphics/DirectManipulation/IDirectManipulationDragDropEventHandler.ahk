#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectManipulationViewport2.ahk" { IDirectManipulationViewport2 }
#Import ".\DIRECTMANIPULATION_DRAG_DROP_STATUS.ahk" { DIRECTMANIPULATION_DRAG_DROP_STATUS }

/**
 * Defines methods to handle drag-drop behavior events.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationdragdropeventhandler
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationDragDropEventHandler extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationDragDropEventHandler
     * @type {Guid}
     */
    static IID := Guid("{1fa11b10-701b-41ae-b5f2-49e36bd595aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationDragDropEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnDragDropStatusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationDragDropEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when a status change happens in the viewport that the drag-and-drop behavior is attached to.
     * @remarks
     * If a class  is implementing <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewporteventhandler">IDirectManipulationViewportEventHandler</a> it should also implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nn-directmanipulation-idirectmanipulationdragdropeventhandler">IDirectManipulationDragDropEventHandler</a> if that viewport will use drag and drop. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/directmanipulation/direct-manipulation-portal">Direct Manipulation</a> will query the <b>IDirectManipulationViewportEventHandler</b> instances to verify that  they also implement <b>IDirectManipulationDragDropEventHandler</b>.
     * @param {IDirectManipulationViewport2} viewport The updated viewport.
     * @param {DIRECTMANIPULATION_DRAG_DROP_STATUS} current The current state of the drag-drop interaction from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_drag_drop_status">DIRECTMANIPULATION_DRAG_DROP_STATUS</a>.
     * @param {DIRECTMANIPULATION_DRAG_DROP_STATUS} previous The previous state of the drag-drop interaction from <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/ne-directmanipulation-directmanipulation_drag_drop_status">DIRECTMANIPULATION_DRAG_DROP_STATUS</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdragdropeventhandler-ondragdropstatuschange
     */
    OnDragDropStatusChange(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, DIRECTMANIPULATION_DRAG_DROP_STATUS, current, DIRECTMANIPULATION_DRAG_DROP_STATUS, previous, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationDragDropEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnDragDropStatusChange := CallbackCreate(GetMethod(implObj, "OnDragDropStatusChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnDragDropStatusChange)
    }
}
