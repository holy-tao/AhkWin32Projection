#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DRIWMDRMSession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBDA_DRIWMDRMSession
     * @type {Guid}
     */
    static IID => Guid("{05c690f8-56db-4bb2-b053-79c12098bb26}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcknowledgeLicense", "ProcessLicenseChallenge", "ProcessRegistrationChallenge", "SetRevInfo", "SetCrl", "GetHMSAssociationData", "GetLastCardeaError"]

    /**
     * 
     * @param {HRESULT} hrLicenseAck 
     * @returns {HRESULT} 
     */
    AcknowledgeLicense(hrLicenseAck) {
        result := ComCall(3, this, "int", hrLicenseAck, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwcbLicenseMessage 
     * @param {Pointer<Integer>} pbLicenseMessage 
     * @param {Pointer<Integer>} pdwcbLicenseResponse 
     * @param {Pointer<Pointer<Integer>>} ppbLicenseResponse 
     * @returns {HRESULT} 
     */
    ProcessLicenseChallenge(dwcbLicenseMessage, pbLicenseMessage, pdwcbLicenseResponse, ppbLicenseResponse) {
        result := ComCall(4, this, "uint", dwcbLicenseMessage, "char*", pbLicenseMessage, "uint*", pdwcbLicenseResponse, "ptr*", ppbLicenseResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwcbRegistrationMessage 
     * @param {Pointer<Integer>} pbRegistrationMessage 
     * @param {Pointer<Integer>} pdwcbRegistrationResponse 
     * @param {Pointer<Pointer<Integer>>} ppbRegistrationResponse 
     * @returns {HRESULT} 
     */
    ProcessRegistrationChallenge(dwcbRegistrationMessage, pbRegistrationMessage, pdwcbRegistrationResponse, ppbRegistrationResponse) {
        result := ComCall(5, this, "uint", dwcbRegistrationMessage, "char*", pbRegistrationMessage, "uint*", pdwcbRegistrationResponse, "ptr*", ppbRegistrationResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRevInfoLen 
     * @param {Pointer<Integer>} pbRevInfo 
     * @param {Pointer<Integer>} pdwResponse 
     * @returns {HRESULT} 
     */
    SetRevInfo(dwRevInfoLen, pbRevInfo, pdwResponse) {
        result := ComCall(6, this, "uint", dwRevInfoLen, "char*", pbRevInfo, "uint*", pdwResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCrlLen 
     * @param {Pointer<Integer>} pbCrlLen 
     * @param {Pointer<Integer>} pdwResponse 
     * @returns {HRESULT} 
     */
    SetCrl(dwCrlLen, pbCrlLen, pdwResponse) {
        result := ComCall(7, this, "uint", dwCrlLen, "char*", pbCrlLen, "uint*", pdwResponse, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetHMSAssociationData() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwError 
     * @returns {HRESULT} 
     */
    GetLastCardeaError(pdwError) {
        result := ComCall(9, this, "uint*", pdwError, "HRESULT")
        return result
    }
}
