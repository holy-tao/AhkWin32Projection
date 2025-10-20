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
     * 
     * @param {Pointer<IDirectManipulationViewport>} viewport 
     * @param {Integer} current 
     * @param {Integer} previous 
     * @returns {HRESULT} 
     */
    OnViewportStatusChanged(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, "int", current, "int", previous, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectManipulationViewport>} viewport 
     * @returns {HRESULT} 
     */
    OnViewportUpdated(viewport) {
        result := ComCall(4, this, "ptr", viewport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDirectManipulationViewport>} viewport 
     * @param {Pointer<IDirectManipulationContent>} content 
     * @returns {HRESULT} 
     */
    OnContentUpdated(viewport, content) {
        result := ComCall(5, this, "ptr", viewport, "ptr", content, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
