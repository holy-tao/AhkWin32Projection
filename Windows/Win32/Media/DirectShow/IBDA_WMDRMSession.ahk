#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_WMDRMSession extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} MaxCaptureToken 
     * @param {Pointer<UInt32>} MaxStreamingPid 
     * @param {Pointer<UInt32>} MaxLicense 
     * @param {Pointer<UInt32>} MinSecurityLevel 
     * @param {Pointer<UInt32>} RevInfoSequenceNumber 
     * @param {Pointer<UInt64>} RevInfoIssuedTime 
     * @param {Pointer<UInt32>} RevInfoTTL 
     * @param {Pointer<UInt32>} RevListVersion 
     * @param {Pointer<UInt32>} ulState 
     * @returns {HRESULT} 
     */
    GetStatus(MaxCaptureToken, MaxStreamingPid, MaxLicense, MinSecurityLevel, RevInfoSequenceNumber, RevInfoIssuedTime, RevInfoTTL, RevListVersion, ulState) {
        result := ComCall(3, this, "uint*", MaxCaptureToken, "uint*", MaxStreamingPid, "uint*", MaxLicense, "uint*", MinSecurityLevel, "uint*", RevInfoSequenceNumber, "uint*", RevInfoIssuedTime, "uint*", RevInfoTTL, "uint*", RevListVersion, "uint*", ulState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulRevInfoLen 
     * @param {Pointer<Byte>} pbRevInfo 
     * @returns {HRESULT} 
     */
    SetRevInfo(ulRevInfoLen, pbRevInfo) {
        result := ComCall(4, this, "uint", ulRevInfoLen, "char*", pbRevInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCrlLen 
     * @param {Pointer<Byte>} pbCrlLen 
     * @returns {HRESULT} 
     */
    SetCrl(ulCrlLen, pbCrlLen) {
        result := ComCall(5, this, "uint", ulCrlLen, "char*", pbCrlLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulcbRequest 
     * @param {Pointer<Byte>} pbRequest 
     * @param {Pointer<UInt32>} pulcbResponse 
     * @param {Pointer<Byte>} pbResponse 
     * @returns {HRESULT} 
     */
    TransactMessage(ulcbRequest, pbRequest, pulcbResponse, pbResponse) {
        result := ComCall(6, this, "uint", ulcbRequest, "char*", pbRequest, "uint*", pulcbResponse, "char*", pbResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uuidKey 
     * @param {Pointer<UInt32>} pulPackageLen 
     * @param {Pointer<Byte>} pbPackage 
     * @returns {HRESULT} 
     */
    GetLicense(uuidKey, pulPackageLen, pbPackage) {
        result := ComCall(7, this, "ptr", uuidKey, "uint*", pulPackageLen, "char*", pbPackage, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} uuidKey 
     * @returns {HRESULT} 
     */
    ReissueLicense(uuidKey) {
        result := ComCall(8, this, "ptr", uuidKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulInXmrLicenseLen 
     * @param {Pointer<Byte>} pbInXmrLicense 
     * @param {Integer} ulEntitlementTokenLen 
     * @param {Pointer<Byte>} pbEntitlementToken 
     * @param {Pointer<UInt32>} pulDescrambleStatus 
     * @param {Pointer<UInt32>} pulOutXmrLicenseLen 
     * @param {Pointer<Byte>} pbOutXmrLicense 
     * @returns {HRESULT} 
     */
    RenewLicense(ulInXmrLicenseLen, pbInXmrLicense, ulEntitlementTokenLen, pbEntitlementToken, pulDescrambleStatus, pulOutXmrLicenseLen, pbOutXmrLicense) {
        result := ComCall(9, this, "uint", ulInXmrLicenseLen, "char*", pbInXmrLicense, "uint", ulEntitlementTokenLen, "char*", pbEntitlementToken, "uint*", pulDescrambleStatus, "uint*", pulOutXmrLicenseLen, "char*", pbOutXmrLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulKeyInfoLen 
     * @param {Pointer<Byte>} pbKeyInfo 
     * @returns {HRESULT} 
     */
    GetKeyInfo(pulKeyInfoLen, pbKeyInfo) {
        result := ComCall(10, this, "uint*", pulKeyInfoLen, "char*", pbKeyInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
