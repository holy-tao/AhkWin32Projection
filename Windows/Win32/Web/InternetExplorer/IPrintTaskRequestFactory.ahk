#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IPrintTaskRequestFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskRequestFactory
     * @type {Guid}
     */
    static IID => Guid("{bb516745-8c34-4f8b-9605-684dcb144be5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePrintTaskRequest"]

    /**
     * 
     * @param {IPrintTaskRequestHandler} pPrintTaskRequestHandler 
     * @returns {HRESULT} 
     */
    CreatePrintTaskRequest(pPrintTaskRequestHandler) {
        result := ComCall(3, this, "ptr", pPrintTaskRequestHandler, "HRESULT")
        return result
    }
}
