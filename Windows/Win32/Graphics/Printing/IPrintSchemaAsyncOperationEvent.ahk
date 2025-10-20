#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintSchemaAsyncOperationEvent extends IDispatch{
    /**
     * The interface identifier for IPrintSchemaAsyncOperationEvent
     * @type {Guid}
     */
    static IID => Guid("{23adbb16-0133-4906-b29a-1dce1d026379}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<IPrintSchemaTicket>} pTicket 
     * @param {HRESULT} hrOperation 
     * @returns {HRESULT} 
     */
    Completed(pTicket, hrOperation) {
        result := ComCall(7, this, "ptr", pTicket, "int", hrOperation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
