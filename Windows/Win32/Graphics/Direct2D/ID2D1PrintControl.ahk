#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Converts Direct2D primitives stored in an ID2D1CommandList into a fixed page representation. The print sub-system then consumes the primitives.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/nn-d2d1_1-id2d1printcontrol
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1PrintControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1PrintControl
     * @type {Guid}
     */
    static IID => Guid("{2c1d867d-c290-41c8-ae7e-34a98702e9a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddPage", "Close"]

    /**
     * 
     * @param {ID2D1CommandList} commandList 
     * @param {D2D_SIZE_F} pageSize 
     * @param {IStream} pagePrintTicketStream 
     * @param {Pointer<Integer>} tag1 
     * @param {Pointer<Integer>} tag2 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1printcontrol-addpage
     */
    AddPage(commandList, pageSize, pagePrintTicketStream, tag1, tag2) {
        tag1Marshal := tag1 is VarRef ? "uint*" : "ptr"
        tag2Marshal := tag2 is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", commandList, "ptr", pageSize, "ptr", pagePrintTicketStream, tag1Marshal, tag1, tag2Marshal, tag2, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/nf-d2d1_1-id2d1printcontrol-close
     */
    Close() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
