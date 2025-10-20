#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_WMDRMTuner extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_WMDRMTuner
     * @type {Guid}
     */
    static IID => Guid("{86d979cf-a8a7-4f94-b5fb-14c0aca68fe6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PurchaseEntitlement", "CancelCaptureToken", "SetPidProtection", "GetPidProtection", "SetSyncValue", "GetStartCodeProfile"]

    /**
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} ulPurchaseTokenLen 
     * @param {Pointer<Integer>} pbPurchaseToken 
     * @param {Pointer<Integer>} pulDescrambleStatus 
     * @param {Pointer<Integer>} pulCaptureTokenLen 
     * @param {Pointer<Integer>} pbCaptureToken 
     * @returns {HRESULT} 
     */
    PurchaseEntitlement(ulDialogRequest, bstrLanguage, ulPurchaseTokenLen, pbPurchaseToken, pulDescrambleStatus, pulCaptureTokenLen, pbCaptureToken) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(3, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", ulPurchaseTokenLen, "char*", pbPurchaseToken, "uint*", pulDescrambleStatus, "uint*", pulCaptureTokenLen, "char*", pbCaptureToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCaptureTokenLen 
     * @param {Pointer<Integer>} pbCaptureToken 
     * @returns {HRESULT} 
     */
    CancelCaptureToken(ulCaptureTokenLen, pbCaptureToken) {
        result := ComCall(4, this, "uint", ulCaptureTokenLen, "char*", pbCaptureToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulPid 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    SetPidProtection(ulPid, uuidKey) {
        result := ComCall(5, this, "uint", ulPid, "ptr", uuidKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pulPid 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    GetPidProtection(pulPid, uuidKey) {
        result := ComCall(6, this, "uint", pulPid, "ptr", uuidKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulSyncValue 
     * @returns {HRESULT} 
     */
    SetSyncValue(ulSyncValue) {
        result := ComCall(7, this, "uint", ulSyncValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStartCodeProfileLen 
     * @param {Pointer<Integer>} pbStartCodeProfile 
     * @returns {HRESULT} 
     */
    GetStartCodeProfile(pulStartCodeProfileLen, pbStartCodeProfile) {
        result := ComCall(8, this, "uint*", pulStartCodeProfileLen, "char*", pbStartCodeProfile, "HRESULT")
        return result
    }
}
