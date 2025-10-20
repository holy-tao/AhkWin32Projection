#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\IESEvent.ahk

/**
 * Implements methods that get information from a LicenseRenewalResult event.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESLicenseRenewalResultEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-ieslicenserenewalresultevent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESLicenseRenewalResultEvent extends IESEvent{
    /**
     * The interface identifier for IESLicenseRenewalResultEvent
     * @type {Guid}
     */
    static IID => Guid("{d5a48ef5-a81b-4df0-acaa-5e35e7ea45d4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<UInt32>} pdwCallersId 
     * @returns {HRESULT} 
     */
    GetCallersId(pdwCallersId) {
        result := ComCall(8, this, "uint*", pdwCallersId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFilename 
     * @returns {HRESULT} 
     */
    GetFileName(pbstrFilename) {
        result := ComCall(9, this, "ptr", pbstrFilename, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfRenewalSuccessful 
     * @returns {HRESULT} 
     */
    IsRenewalSuccessful(pfRenewalSuccessful) {
        result := ComCall(10, this, "ptr", pfRenewalSuccessful, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfCheckEntTokenCallNeeded 
     * @returns {HRESULT} 
     */
    IsCheckEntitlementCallRequired(pfCheckEntTokenCallNeeded) {
        result := ComCall(11, this, "ptr", pfCheckEntTokenCallNeeded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pDescrambledStatus 
     * @returns {HRESULT} 
     */
    GetDescrambledStatus(pDescrambledStatus) {
        result := ComCall(12, this, "uint*", pDescrambledStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwRenewalResultCode 
     * @returns {HRESULT} 
     */
    GetRenewalResultCode(pdwRenewalResultCode) {
        result := ComCall(13, this, "uint*", pdwRenewalResultCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCASFailureCode 
     * @returns {HRESULT} 
     */
    GetCASFailureCode(pdwCASFailureCode) {
        result := ComCall(14, this, "uint*", pdwCASFailureCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phr 
     * @returns {HRESULT} 
     */
    GetRenewalHResult(phr) {
        result := ComCall(15, this, "ptr", phr, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwLength 
     * @returns {HRESULT} 
     */
    GetEntitlementTokenLength(pdwLength) {
        result := ComCall(16, this, "uint*", pdwLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pbData 
     * @returns {HRESULT} 
     */
    GetEntitlementToken(pbData) {
        result := ComCall(17, this, "ptr", pbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt64>} pqwExpiryDate 
     * @returns {HRESULT} 
     */
    GetExpiryDate(pqwExpiryDate) {
        result := ComCall(18, this, "uint*", pqwExpiryDate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
