#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IBDA_DRIWMDRMSession extends IUnknown{
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
     * 
     * @param {HRESULT} hrLicenseAck 
     * @returns {HRESULT} 
     */
    AcknowledgeLicense(hrLicenseAck) {
        result := ComCall(3, this, "int", hrLicenseAck, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwcbLicenseMessage 
     * @param {Pointer<Byte>} pbLicenseMessage 
     * @param {Pointer<UInt32>} pdwcbLicenseResponse 
     * @param {Pointer<Byte>} ppbLicenseResponse 
     * @returns {HRESULT} 
     */
    ProcessLicenseChallenge(dwcbLicenseMessage, pbLicenseMessage, pdwcbLicenseResponse, ppbLicenseResponse) {
        result := ComCall(4, this, "uint", dwcbLicenseMessage, "char*", pbLicenseMessage, "uint*", pdwcbLicenseResponse, "char*", ppbLicenseResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwcbRegistrationMessage 
     * @param {Pointer<Byte>} pbRegistrationMessage 
     * @param {Pointer<UInt32>} pdwcbRegistrationResponse 
     * @param {Pointer<Byte>} ppbRegistrationResponse 
     * @returns {HRESULT} 
     */
    ProcessRegistrationChallenge(dwcbRegistrationMessage, pbRegistrationMessage, pdwcbRegistrationResponse, ppbRegistrationResponse) {
        result := ComCall(5, this, "uint", dwcbRegistrationMessage, "char*", pbRegistrationMessage, "uint*", pdwcbRegistrationResponse, "char*", ppbRegistrationResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwRevInfoLen 
     * @param {Pointer<Byte>} pbRevInfo 
     * @param {Pointer<UInt32>} pdwResponse 
     * @returns {HRESULT} 
     */
    SetRevInfo(dwRevInfoLen, pbRevInfo, pdwResponse) {
        result := ComCall(6, this, "uint", dwRevInfoLen, "char*", pbRevInfo, "uint*", pdwResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCrlLen 
     * @param {Pointer<Byte>} pbCrlLen 
     * @param {Pointer<UInt32>} pdwResponse 
     * @returns {HRESULT} 
     */
    SetCrl(dwCrlLen, pbCrlLen, pdwResponse) {
        result := ComCall(7, this, "uint", dwCrlLen, "char*", pbCrlLen, "uint*", pdwResponse, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    GetHMSAssociationData() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwError 
     * @returns {HRESULT} 
     */
    GetLastCardeaError(pdwError) {
        result := ComCall(9, this, "uint*", pdwError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
