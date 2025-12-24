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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify"]

    /**
     * Notify method is documented only for compliance; its use is not recommended and may be altered or unavailable in the future. Instead, and use RegisterProgressNotification.
     * @param {Integer} uFrameNum Type: <b>ULONG</b>
     * 
     * The current frame number.
     * @param {Integer} operation Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicprogressoperation">WICProgressOperation</a></b>
     * 
     * The operation on which progress is being reported.
     * @param {Float} dblProgress Type: <b>double</b>
     * 
     * The progress value ranging from is 0.0 to 1.0. 0.0 indicates the beginning of the operation. 1.0 indicates the end of the operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicprogresscallback-notify
     */
    Notify(uFrameNum, operation, dblProgress) {
        result := ComCall(3, this, "uint", uFrameNum, "int", operation, "double", dblProgress, "HRESULT")
        return result
    }
}
