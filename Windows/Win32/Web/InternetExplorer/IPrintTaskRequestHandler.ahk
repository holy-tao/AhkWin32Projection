#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IPrintTaskRequestHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintTaskRequestHandler
     * @type {Guid}
     */
    static IID => Guid("{191cd340-cf36-44ff-bd53-d1b701799d9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["HandlePrintTaskRequest"]

    /**
     * 
     * @param {IInspectable} pPrintTaskRequest 
     * @returns {HRESULT} 
     */
    HandlePrintTaskRequest(pPrintTaskRequest) {
        result := ComCall(3, this, "ptr", pPrintTaskRequest, "HRESULT")
        return result
    }
}
