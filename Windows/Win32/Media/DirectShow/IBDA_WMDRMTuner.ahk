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
     * 
     * @param {Integer} ulDialogRequest 
     * @param {BSTR} bstrLanguage 
     * @param {Integer} ulPurchaseTokenLen 
     * @param {Pointer<Byte>} pbPurchaseToken 
     * @param {Pointer<UInt32>} pulDescrambleStatus 
     * @param {Pointer<UInt32>} pulCaptureTokenLen 
     * @param {Pointer<Byte>} pbCaptureToken 
     * @returns {HRESULT} 
     */
    PurchaseEntitlement(ulDialogRequest, bstrLanguage, ulPurchaseTokenLen, pbPurchaseToken, pulDescrambleStatus, pulCaptureTokenLen, pbCaptureToken) {
        bstrLanguage := bstrLanguage is String ? BSTR.Alloc(bstrLanguage).Value : bstrLanguage

        result := ComCall(3, this, "uint", ulDialogRequest, "ptr", bstrLanguage, "uint", ulPurchaseTokenLen, "char*", pbPurchaseToken, "uint*", pulDescrambleStatus, "uint*", pulCaptureTokenLen, "char*", pbCaptureToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCaptureTokenLen 
     * @param {Pointer<Byte>} pbCaptureToken 
     * @returns {HRESULT} 
     */
    CancelCaptureToken(ulCaptureTokenLen, pbCaptureToken) {
        result := ComCall(4, this, "uint", ulCaptureTokenLen, "char*", pbCaptureToken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulPid 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    SetPidProtection(ulPid, uuidKey) {
        result := ComCall(5, this, "uint", ulPid, "ptr", uuidKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} pulPid 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    GetPidProtection(pulPid, uuidKey) {
        result := ComCall(6, this, "uint", pulPid, "ptr", uuidKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulSyncValue 
     * @returns {HRESULT} 
     */
    SetSyncValue(ulSyncValue) {
        result := ComCall(7, this, "uint", ulSyncValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStartCodeProfileLen 
     * @param {Pointer<Byte>} pbStartCodeProfile 
     * @returns {HRESULT} 
     */
    GetStartCodeProfile(pulStartCodeProfileLen, pbStartCodeProfile) {
        result := ComCall(8, this, "uint*", pulStartCodeProfileLen, "char*", pbStartCodeProfile, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
