#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IFixedDocument extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFixedDocument
     * @type {Guid}
     */
    static IID => Guid("{f222ca9f-9968-4db9-81bd-abaebf15f93f}")

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
     * @param {Pointer<BSTR>} uri 
     * @returns {HRESULT} 
     */
    GetUri(uri) {
        result := ComCall(3, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPartPrintTicket>} ppPrintTicket 
     * @returns {HRESULT} 
     */
    GetPrintTicket(ppPrintTicket) {
        result := ComCall(4, this, "ptr*", ppPrintTicket, "HRESULT")
        return result
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
