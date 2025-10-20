#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * IWICProgressCallback interface is documented only for compliance; its use is not recommended and may be altered or unavailable in the future. Instead, and use RegisterProgressNotification.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicprogresscallback
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICProgressCallback extends IUnknown{
    /**
     * The interface identifier for IWICProgressCallback
     * @type {Guid}
     */
    static IID => Guid("{4776f9cd-9517-45fa-bf24-e89c5ec5c60c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} uFrameNum 
     * @param {Integer} operation 
     * @param {Float} dblProgress 
     * @returns {HRESULT} 
     */
    Notify(uFrameNum, operation, dblProgress) {
        result := ComCall(3, this, "uint", uFrameNum, "int", operation, "double", dblProgress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
