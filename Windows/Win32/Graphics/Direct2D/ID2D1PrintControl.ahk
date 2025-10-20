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
     * 
     * @param {Pointer<ID2D1CommandList>} commandList 
     * @param {D2D_SIZE_F} pageSize 
     * @param {Pointer<IStream>} pagePrintTicketStream 
     * @param {Pointer<UInt64>} tag1 
     * @param {Pointer<UInt64>} tag2 
     * @returns {HRESULT} 
     */
    AddPage(commandList, pageSize, pagePrintTicketStream, tag1, tag2) {
        result := ComCall(3, this, "ptr", commandList, "ptr", pageSize, "ptr", pagePrintTicketStream, "uint*", tag1, "uint*", tag2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
