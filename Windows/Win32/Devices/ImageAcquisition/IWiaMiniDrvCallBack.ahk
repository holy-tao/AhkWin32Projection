#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaMiniDrvCallBack extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaMiniDrvCallBack
     * @type {Guid}
     */
    static IID => Guid("{33a57d5a-3de8-11d2-9a36-00c04fa36145}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["MiniDrvCallback"]

    /**
     * 
     * @param {Integer} lReason 
     * @param {Integer} lStatus 
     * @param {Integer} lPercentComplete 
     * @param {Integer} lOffset 
     * @param {Integer} lLength 
     * @param {Pointer<MINIDRV_TRANSFER_CONTEXT>} pTranCtx 
     * @param {Integer} lReserved 
     * @returns {HRESULT} 
     */
    MiniDrvCallback(lReason, lStatus, lPercentComplete, lOffset, lLength, pTranCtx, lReserved) {
        result := ComCall(3, this, "int", lReason, "int", lStatus, "int", lPercentComplete, "int", lOffset, "int", lLength, "ptr", pTranCtx, "int", lReserved, "HRESULT")
        return result
    }
}
