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
        MaxCaptureTokenMarshal := MaxCaptureToken is VarRef ? "uint*" : "ptr"
        MaxStreamingPidMarshal := MaxStreamingPid is VarRef ? "uint*" : "ptr"
        MaxLicenseMarshal := MaxLicense is VarRef ? "uint*" : "ptr"
        MinSecurityLevelMarshal := MinSecurityLevel is VarRef ? "uint*" : "ptr"
        RevInfoSequenceNumberMarshal := RevInfoSequenceNumber is VarRef ? "uint*" : "ptr"
        RevInfoIssuedTimeMarshal := RevInfoIssuedTime is VarRef ? "uint*" : "ptr"
        RevInfoTTLMarshal := RevInfoTTL is VarRef ? "uint*" : "ptr"
        RevListVersionMarshal := RevListVersion is VarRef ? "uint*" : "ptr"
        ulStateMarshal := ulState is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, MaxCaptureTokenMarshal, MaxCaptureToken, MaxStreamingPidMarshal, MaxStreamingPid, MaxLicenseMarshal, MaxLicense, MinSecurityLevelMarshal, MinSecurityLevel, RevInfoSequenceNumberMarshal, RevInfoSequenceNumber, RevInfoIssuedTimeMarshal, RevInfoIssuedTime, RevInfoTTLMarshal, RevInfoTTL, RevListVersionMarshal, RevListVersion, ulStateMarshal, ulState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulRevInfoLen 
     * @param {Pointer<Integer>} pbRevInfo 
     * @returns {HRESULT} 
     */
    SetRevInfo(ulRevInfoLen, pbRevInfo) {
        pbRevInfoMarshal := pbRevInfo is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "uint", ulRevInfoLen, pbRevInfoMarshal, pbRevInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCrlLen 
     * @param {Pointer<Integer>} pbCrlLen 
     * @returns {HRESULT} 
     */
    SetCrl(ulCrlLen, pbCrlLen) {
        pbCrlLenMarshal := pbCrlLen is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, "uint", ulCrlLen, pbCrlLenMarshal, pbCrlLen, "HRESULT")
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
        pbRequestMarshal := pbRequest is VarRef ? "char*" : "ptr"
        pulcbResponseMarshal := pulcbResponse is VarRef ? "uint*" : "ptr"
        pbResponseMarshal := pbResponse is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "uint", ulcbRequest, pbRequestMarshal, pbRequest, pulcbResponseMarshal, pulcbResponse, pbResponseMarshal, pbResponse, "HRESULT")
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
        pulPackageLenMarshal := pulPackageLen is VarRef ? "uint*" : "ptr"
        pbPackageMarshal := pbPackage is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", uuidKey, pulPackageLenMarshal, pulPackageLen, pbPackageMarshal, pbPackage, "HRESULT")
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
     * @param {Pointer<Integer>} pulOutXmrLicenseLen 
     * @param {Pointer<Integer>} pbOutXmrLicense 
     * @returns {Integer} 
     */
    RenewLicense(ulInXmrLicenseLen, pbInXmrLicense, ulEntitlementTokenLen, pbEntitlementToken, pulOutXmrLicenseLen, pbOutXmrLicense) {
        pbInXmrLicenseMarshal := pbInXmrLicense is VarRef ? "char*" : "ptr"
        pbEntitlementTokenMarshal := pbEntitlementToken is VarRef ? "char*" : "ptr"
        pulOutXmrLicenseLenMarshal := pulOutXmrLicenseLen is VarRef ? "uint*" : "ptr"
        pbOutXmrLicenseMarshal := pbOutXmrLicense is VarRef ? "char*" : "ptr"

        result := ComCall(9, this, "uint", ulInXmrLicenseLen, pbInXmrLicenseMarshal, pbInXmrLicense, "uint", ulEntitlementTokenLen, pbEntitlementTokenMarshal, pbEntitlementToken, "uint*", &pulDescrambleStatus := 0, pulOutXmrLicenseLenMarshal, pulOutXmrLicenseLen, pbOutXmrLicenseMarshal, pbOutXmrLicense, "HRESULT")
        return pulDescrambleStatus
    }

    /**
     * 
     * @param {Pointer<Integer>} pulKeyInfoLen 
     * @param {Pointer<Integer>} pbKeyInfo 
     * @returns {HRESULT} 
     */
    GetKeyInfo(pulKeyInfoLen, pbKeyInfo) {
        pulKeyInfoLenMarshal := pulKeyInfoLen is VarRef ? "uint*" : "ptr"
        pbKeyInfoMarshal := pbKeyInfo is VarRef ? "char*" : "ptr"

        result := ComCall(10, this, pulKeyInfoLenMarshal, pulKeyInfoLen, pbKeyInfoMarshal, pbKeyInfo, "HRESULT")
        return result
    }
}
