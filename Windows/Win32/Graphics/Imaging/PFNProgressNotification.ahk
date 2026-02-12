#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Application defined callback function called when codec component progress is made.
 * @remarks
 * An operation can be canceled by returning <c>WINCODEC_ERR_ABORTED</c>.
 * 
 * To register your callback function, query the encoder or decoder for the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapcodecprogressnotification">IWICBitmapCodecProgressNotification</a> interface and call <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapcodecprogressnotification-registerprogressnotification">RegisterProgressNotification</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wincodec/nc-wincodec-pfnprogressnotification
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class PFNProgressNotification extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<Void>} pvData 
     * @param {Integer} uFrameNum 
     * @param {Integer} operation 
     * @param {Float} dblProgress 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pvData, uFrameNum, operation, dblProgress) {
        pvDataMarshal := pvData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, pvDataMarshal, pvData, "uint", uFrameNum, "int", operation, "double", dblProgress, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
