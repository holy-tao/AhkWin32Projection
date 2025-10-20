#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IPrintPipelineManagerControl extends IUnknown{
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
     * 
     * @param {HRESULT} hrReason 
     * @param {Pointer<IImgErrorInfo>} pReason 
     * @returns {HRESULT} 
     */
    RequestShutdown(hrReason, pReason) {
        result := ComCall(3, this, "int", hrReason, "ptr", pReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    FilterFinished() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
