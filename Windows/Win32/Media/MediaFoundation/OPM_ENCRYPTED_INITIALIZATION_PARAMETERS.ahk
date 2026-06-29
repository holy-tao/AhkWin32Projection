#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains encrypted initialization parameters for an Output Protection Manager (OPM) session. (OPM_ENCRYPTED_INITIALIZATION_PARAMETERS).
 * @remarks
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppsignature">AMCOPPSignature</a> structure used in Certified Output Protection Protocol (COPP).
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_encrypted_initialization_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_ENCRYPTED_INITIALIZATION_PARAMETERS {
    #StructPack 1

    /**
     * Pointer to a buffer that contains encrypted initialization parameters for the session. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-finishinitialization">IOPMVideoOutput::FinishInitialization</a>.
     */
    abEncryptedInitializationParameters : Int8[256]

}
