#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling status and update events for the viewport.
 * @remarks
 * 
  * Client apps implement this handler to receive status and update events for viewports. Use <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewport-addeventhandler">AddEventHandler</a> to set the handler for a viewport. Each viewport can have more than one handler.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationviewporteventhandler
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
     * 
     * @param {IDirectManipulationViewport} viewport 
     * @param {Integer} current 
     * @param {Integer} previous 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportstatuschanged
     */
    OnViewportStatusChanged(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, "int", current, "int", previous, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectManipulationViewport} viewport 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-onviewportupdated
     */
    OnViewportUpdated(viewport) {
        result := ComCall(4, this, "ptr", viewport, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IDirectManipulationViewport} viewport 
     * @param {IDirectManipulationContent} content 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationviewporteventhandler-oncontentupdated
     */
    OnContentUpdated(viewport, content) {
        result := ComCall(5, this, "ptr", viewport, "ptr", content, "HRESULT")
        return result
    }
}
