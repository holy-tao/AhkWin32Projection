#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IPartPrintTicket.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IFixedDocumentSequence extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUri", "GetPrintTicket", "SetPrintTicket"]

    /**
     * 
     * @returns {BSTR} 
     */
    GetUri() {
        uri := BSTR()
        result := ComCall(3, this, "ptr", uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @returns {IPartPrintTicket} 
     */
    GetPrintTicket() {
        result := ComCall(4, this, "ptr*", &ppPrintTicket := 0, "HRESULT")
        return IPartPrintTicket(ppPrintTicket)
    }

    /**
     * 
     * @param {IPartPrintTicket} pPrintTicket 
     * @returns {HRESULT} 
     */
    SetPrintTicket(pPrintTicket) {
        result := ComCall(5, this, "ptr", pPrintTicket, "HRESULT")
        return result
    }
}
