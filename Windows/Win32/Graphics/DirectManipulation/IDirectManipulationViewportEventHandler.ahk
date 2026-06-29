#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DIRECTMANIPULATION_STATUS.ahk" { DIRECTMANIPULATION_STATUS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDirectManipulationViewport.ahk" { IDirectManipulationViewport }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDirectManipulationContent.ahk" { IDirectManipulationContent }

/**
 * Defines methods for handling status and update events for the viewport.
 * @remarks
 * Client apps implement this handler to receive status and update events for viewports. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler">AddEventHandler</a> to set the handler for a viewport. Each viewport can have more than one handler.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewporteventhandler
 * @namespace Windows.Win32.Graphics.DirectManipulation
 */
export default struct IDirectManipulationViewportEventHandler extends IUnknown {
    /**
     * The interface identifier for IDirectManipulationViewportEventHandler
     * @type {Guid}
     */
    static IID := Guid("{952121da-d69f-45f9-b0f9-f23944321a6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDirectManipulationViewportEventHandler interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnViewportStatusChanged : IntPtr
        OnViewportUpdated       : IntPtr
        OnContentUpdated        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDirectManipulationViewportEventHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the status of a viewport changes.
     * @remarks
     * If you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getstatus">GetStatus</a> from within this handler, the status returned is not guaranteed to be the same as at the time of the call. This is because of the asynchronous nature of the notification.
     * @param {IDirectManipulationViewport} viewport The viewport for which status has changed.
     * @param {DIRECTMANIPULATION_STATUS} current The new status of the viewport.
     * @param {DIRECTMANIPULATION_STATUS} previous The previous status of the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportstatuschanged
     */
    OnViewportStatusChanged(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, DIRECTMANIPULATION_STATUS, current, DIRECTMANIPULATION_STATUS, previous, "HRESULT")
        return result
    }

    /**
     * Called after all content in the viewport has been updated.
     * @remarks
     * If you have actions that need to be executed once for a viewport update, implement <b>OnViewportUpdated</b>. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-oncontentupdated">OnContentUpdated</a> is called once for each  content change in the viewport. This can result in multiple <b>OnContentUpdated</b> calls.
     * @param {IDirectManipulationViewport} viewport The viewport that has been updated.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportupdated
     */
    OnViewportUpdated(viewport) {
        result := ComCall(4, this, "ptr", viewport, "HRESULT")
        return result
    }

    /**
     * Called when content inside a viewport is updated.
     * @remarks
     * This method is called once for each  content change in the viewport. This can result in multiple <b>OnContentUpdated</b> calls. For instance, when the position of the content is changed, you can use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationcontent-getcontenttransform">IDirectManipualtionContent::GetContentTransform</a> to retrieve the new value.
     * 
     * If you have actions that need to be executed once for a viewport update, implement <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportupdated">OnViewportUpdated</a>.
     * @param {IDirectManipulationViewport} viewport The viewport that is updated.
     * @param {IDirectManipulationContent} content The content in the viewport that has changed.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-oncontentupdated
     */
    OnContentUpdated(viewport, content) {
        result := ComCall(5, this, "ptr", viewport, "ptr", content, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDirectManipulationViewportEventHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnViewportStatusChanged := CallbackCreate(GetMethod(implObj, "OnViewportStatusChanged"), flags, 4)
        this.vtbl.OnViewportUpdated := CallbackCreate(GetMethod(implObj, "OnViewportUpdated"), flags, 2)
        this.vtbl.OnContentUpdated := CallbackCreate(GetMethod(implObj, "OnContentUpdated"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnViewportStatusChanged)
        CallbackFree(this.vtbl.OnViewportUpdated)
        CallbackFree(this.vtbl.OnContentUpdated)
    }
}
