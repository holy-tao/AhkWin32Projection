#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods to handle drag-drop behavior events.
 * @see https://docs.microsoft.com/windows/win32/api//directmanipulation/nn-directmanipulation-idirectmanipulationdragdropeventhandler
 * @namespace Windows.Win32.Graphics.DirectManipulation
 * @version v4.0.30319
 */
class IDirectManipulationDragDropEventHandler extends IUnknown{
    /**
     * The interface identifier for IDirectManipulationDragDropEventHandler
     * @type {Guid}
     */
    static IID => Guid("{1fa11b10-701b-41ae-b5f2-49e36bd595aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IDirectManipulationViewport2>} viewport 
     * @param {Integer} current 
     * @param {Integer} previous 
     * @returns {HRESULT} 
     */
    OnDragDropStatusChange(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, "int", current, "int", previous, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
