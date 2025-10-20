#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a video output for an Output Protection Manager (OPM) session.
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/nn-opmapi-iopmvideooutput
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IOPMVideoOutput extends IUnknown{
    /**
     * The interface identifier for IOPMVideoOutput
     * @type {Guid}
     */
    static IID => Guid("{0a15159d-41c7-4456-93e1-284cd61d4e8d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<OPM_RANDOM_NUMBER>} prnRandomNumber 
     * @param {Pointer<Byte>} ppbCertificate 
     * @param {Pointer<UInt32>} pulCertificateLength 
     * @returns {HRESULT} 
     */
    StartInitialization(prnRandomNumber, ppbCertificate, pulCertificateLength) {
        result := ComCall(3, this, "ptr", prnRandomNumber, "char*", ppbCertificate, "uint*", pulCertificateLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OPM_ENCRYPTED_INITIALIZATION_PARAMETERS>} pParameters 
     * @returns {HRESULT} 
     */
    FinishInitialization(pParameters) {
        result := ComCall(4, this, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OPM_GET_INFO_PARAMETERS>} pParameters 
     * @param {Pointer<OPM_REQUESTED_INFORMATION>} pRequestedInformation 
     * @returns {HRESULT} 
     */
    GetInformation(pParameters, pRequestedInformation) {
        result := ComCall(5, this, "ptr", pParameters, "ptr", pRequestedInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS>} pParameters 
     * @param {Pointer<OPM_REQUESTED_INFORMATION>} pRequestedInformation 
     * @returns {HRESULT} 
     */
    COPPCompatibleGetInformation(pParameters, pRequestedInformation) {
        result := ComCall(6, this, "ptr", pParameters, "ptr", pRequestedInformation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<OPM_CONFIGURE_PARAMETERS>} pParameters 
     * @param {Integer} ulAdditionalParametersSize 
     * @param {Pointer} pbAdditionalParameters 
     * @returns {HRESULT} 
     */
    Configure(pParameters, ulAdditionalParametersSize, pbAdditionalParameters) {
        result := ComCall(7, this, "ptr", pParameters, "uint", ulAdditionalParametersSize, "ptr", pbAdditionalParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
