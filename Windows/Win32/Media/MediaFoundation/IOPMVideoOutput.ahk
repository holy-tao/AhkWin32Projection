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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartInitialization", "FinishInitialization", "GetInformation", "COPPCompatibleGetInformation", "Configure"]

    /**
     * 
     * @param {Pointer<OPM_RANDOM_NUMBER>} prnRandomNumber 
     * @param {Pointer<Pointer<Integer>>} ppbCertificate 
     * @param {Pointer<Integer>} pulCertificateLength 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-iopmvideooutput-startinitialization
     */
    StartInitialization(prnRandomNumber, ppbCertificate, pulCertificateLength) {
        pulCertificateLengthMarshal := pulCertificateLength is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", prnRandomNumber, "ptr*", ppbCertificate, pulCertificateLengthMarshal, pulCertificateLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPM_ENCRYPTED_INITIALIZATION_PARAMETERS>} pParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-iopmvideooutput-finishinitialization
     */
    FinishInitialization(pParameters) {
        result := ComCall(4, this, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPM_GET_INFO_PARAMETERS>} pParameters 
     * @param {Pointer<OPM_REQUESTED_INFORMATION>} pRequestedInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-iopmvideooutput-getinformation
     */
    GetInformation(pParameters, pRequestedInformation) {
        result := ComCall(5, this, "ptr", pParameters, "ptr", pRequestedInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPM_COPP_COMPATIBLE_GET_INFO_PARAMETERS>} pParameters 
     * @param {Pointer<OPM_REQUESTED_INFORMATION>} pRequestedInformation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-iopmvideooutput-coppcompatiblegetinformation
     */
    COPPCompatibleGetInformation(pParameters, pRequestedInformation) {
        result := ComCall(6, this, "ptr", pParameters, "ptr", pRequestedInformation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<OPM_CONFIGURE_PARAMETERS>} pParameters 
     * @param {Integer} ulAdditionalParametersSize 
     * @param {Pointer} pbAdditionalParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/opmapi/nf-opmapi-iopmvideooutput-configure
     */
    Configure(pParameters, ulAdditionalParametersSize, pbAdditionalParameters) {
        result := ComCall(7, this, "ptr", pParameters, "uint", ulAdditionalParametersSize, "ptr", pbAdditionalParameters, "HRESULT")
        return result
    }
}
