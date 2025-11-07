#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains initialization parameters for an Output Protection Manager (OPM) session.
 * @remarks
 * 
 * The layout of this structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-amcoppsignature">AMCOPPSignature</a> structure used in Certified Output Protection Protocol (COPP).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ns-opmapi-opm_encrypted_initialization_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_ENCRYPTED_INITIALIZATION_PARAMETERS extends Win32Struct
{
    static sizeof => 256

    static packingSize => 1

    /**
     * Pointer to a buffer that contains encrypted initialization parameters for the session. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/opmapi/nf-opmapi-iopmvideooutput-finishinitialization">IOPMVideoOutput::FinishInitialization</a>.
     * @type {Array<Byte>}
     */
    abEncryptedInitializationParameters{
        get {
            if(!this.HasProp("__abEncryptedInitializationParametersProxyArray"))
                this.__abEncryptedInitializationParametersProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "char")
            return this.__abEncryptedInitializationParametersProxyArray
        }
    }
}
