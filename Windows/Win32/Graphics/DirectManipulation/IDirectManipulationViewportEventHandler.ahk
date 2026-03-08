#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling status and update events for the viewport.
 * @remarks
 * Client apps implement this handler to receive status and update events for viewports. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler">AddEventHandler</a> to set the handler for a viewport. Each viewport can have more than one handler.
 * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nn-directmanipulation-idirectmanipulationviewporteventhandler
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationViewportEventHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirectManipulationViewportEventHandler
     * @type {Guid}
     */
    static IID => Guid("{952121da-d69f-45f9-b0f9-f23944321a6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnViewportStatusChanged", "OnViewportUpdated", "OnContentUpdated"]

    /**
     * Called when the status of a viewport changes.
     * @remarks
     * If you call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-getstatus">GetStatus</a> from within this handler, the status returned is not guaranteed to be the same as at the time of the call. This is because of the asynchronous nature of the notification.
     * @param {IDirectManipulationViewport} viewport The viewport for which status has changed.
     * @param {Integer} current The new status of the viewport.
     * @param {Integer} previous The previous status of the viewport.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportstatuschanged
     */
    OnViewportStatusChanged(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, "int", current, "int", previous, "HRESULT")
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
}
