#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelineManagerControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPrintPipelineManagerControl
     * @type {Guid}
     */
    static IID => Guid("{aa3e4910-5889-4681-91ef-823ad4ed4e44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestShutdown", "FilterFinished"]

    /**
     * 
     * @param {HRESULT} hrReason 
     * @param {IImgErrorInfo} pReason 
     * @returns {HRESULT} 
     */
    RequestShutdown(hrReason, pReason) {
        result := ComCall(3, this, "int", hrReason, "ptr", pReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FilterFinished() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
