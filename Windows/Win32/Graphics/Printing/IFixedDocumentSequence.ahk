#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IFixedDocumentSequence extends IUnknown{
    /**
     * The interface identifier for IFixedDocumentSequence
     * @type {Guid}
     */
    static IID => Guid("{8028d181-2c32-4249-8493-1bfb22045574}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BSTR>} uri 
     * @returns {HRESULT} 
     */
    GetUri(uri) {
        result := ComCall(3, this, "ptr", uri, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPartPrintTicket>} ppPrintTicket 
     * @returns {HRESULT} 
     */
    GetPrintTicket(ppPrintTicket) {
        result := ComCall(4, this, "ptr", ppPrintTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPartPrintTicket>} pPrintTicket 
     * @returns {HRESULT} 
     */
    SetPrintTicket(pPrintTicket) {
        result := ComCall(5, this, "ptr", pPrintTicket, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
