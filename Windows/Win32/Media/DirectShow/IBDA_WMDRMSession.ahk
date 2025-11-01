#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_WMDRMSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_WMDRMSession
     * @type {Guid}
     */
    static IID => Guid("{4be6fa3d-07cd-4139-8b80-8c18ba3aec88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "SetRevInfo", "SetCrl", "TransactMessage", "GetLicense", "ReissueLicense", "RenewLicense", "GetKeyInfo"]

    /**
     * 
     * @param {Pointer<Integer>} MaxCaptureToken 
     * @param {Pointer<Integer>} MaxStreamingPid 
     * @param {Pointer<Integer>} MaxLicense 
     * @param {Pointer<Integer>} MinSecurityLevel 
     * @param {Pointer<Integer>} RevInfoSequenceNumber 
     * @param {Pointer<Integer>} RevInfoIssuedTime 
     * @param {Pointer<Integer>} RevInfoTTL 
     * @param {Pointer<Integer>} RevListVersion 
     * @param {Pointer<Integer>} ulState 
     * @returns {HRESULT} 
     */
    GetStatus(MaxCaptureToken, MaxStreamingPid, MaxLicense, MinSecurityLevel, RevInfoSequenceNumber, RevInfoIssuedTime, RevInfoTTL, RevListVersion, ulState) {
        result := ComCall(3, this, "uint*", MaxCaptureToken, "uint*", MaxStreamingPid, "uint*", MaxLicense, "uint*", MinSecurityLevel, "uint*", RevInfoSequenceNumber, "uint*", RevInfoIssuedTime, "uint*", RevInfoTTL, "uint*", RevListVersion, "uint*", ulState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRevInfoLen 
     * @param {Pointer<Integer>} pbRevInfo 
     * @returns {HRESULT} 
     */
    SetRevInfo(ulRevInfoLen, pbRevInfo) {
        result := ComCall(4, this, "uint", ulRevInfoLen, "char*", pbRevInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCrlLen 
     * @param {Pointer<Integer>} pbCrlLen 
     * @returns {HRESULT} 
     */
    SetCrl(ulCrlLen, pbCrlLen) {
        result := ComCall(5, this, "uint", ulCrlLen, "char*", pbCrlLen, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulcbRequest 
     * @param {Pointer<Integer>} pbRequest 
     * @param {Pointer<Integer>} pulcbResponse 
     * @param {Pointer<Integer>} pbResponse 
     * @returns {HRESULT} 
     */
    TransactMessage(ulcbRequest, pbRequest, pulcbResponse, pbResponse) {
        result := ComCall(6, this, "uint", ulcbRequest, "char*", pbRequest, "uint*", pulcbResponse, "char*", pbResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uuidKey 
     * @param {Pointer<Integer>} pulPackageLen 
     * @param {Pointer<Integer>} pbPackage 
     * @returns {HRESULT} 
     */
    GetLicense(uuidKey, pulPackageLen, pbPackage) {
        result := ComCall(7, this, "ptr", uuidKey, "uint*", pulPackageLen, "char*", pbPackage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    ReissueLicense(uuidKey) {
        result := ComCall(8, this, "ptr", uuidKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulInXmrLicenseLen 
     * @param {Pointer<Integer>} pbInXmrLicense 
     * @param {Integer} ulEntitlementTokenLen 
     * @param {Pointer<Integer>} pbEntitlementToken 
     * @param {Pointer<Integer>} pulDescrambleStatus 
     * @param {Pointer<Integer>} pulOutXmrLicenseLen 
     * @param {Pointer<Integer>} pbOutXmrLicense 
     * @returns {HRESULT} 
     */
    RenewLicense(ulInXmrLicenseLen, pbInXmrLicense, ulEntitlementTokenLen, pbEntitlementToken, pulDescrambleStatus, pulOutXmrLicenseLen, pbOutXmrLicense) {
        result := ComCall(9, this, "uint", ulInXmrLicenseLen, "char*", pbInXmrLicense, "uint", ulEntitlementTokenLen, "char*", pbEntitlementToken, "uint*", pulDescrambleStatus, "uint*", pulOutXmrLicenseLen, "char*", pbOutXmrLicense, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulKeyInfoLen 
     * @param {Pointer<Integer>} pbKeyInfo 
     * @returns {HRESULT} 
     */
    GetKeyInfo(pulKeyInfoLen, pbKeyInfo) {
        result := ComCall(10, this, "uint*", pulKeyInfoLen, "char*", pbKeyInfo, "HRESULT")
        return result
    }
}
