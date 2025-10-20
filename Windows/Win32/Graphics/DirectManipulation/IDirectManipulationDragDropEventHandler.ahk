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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnDragDropStatusChange"]

    /**
     * 
     * @param {IDirectManipulationViewport2} viewport 
     * @param {Integer} current 
     * @param {Integer} previous 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/directmanipulation/nf-directmanipulation-idirectmanipulationdragdropeventhandler-ondragdropstatuschange
     */
    OnDragDropStatusChange(viewport, current, previous) {
        result := ComCall(3, this, "ptr", viewport, "int", current, "int", previous, "HRESULT")
        return result
    }
}
