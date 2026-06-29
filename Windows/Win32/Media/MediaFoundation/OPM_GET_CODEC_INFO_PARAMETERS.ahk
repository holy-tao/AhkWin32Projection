#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * OPM_GET_CODEC_INFO_PARAMETERS (opmapi.h) contains information for the OPM_GET_CODEC_INFO command.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_get_codec_info_parameters
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_GET_CODEC_INFO_PARAMETERS {
    #StructPack 4

    /**
     * The amount of valid data in the <b>Verifier</b> array, in bytes.
     */
    cbVerifier : UInt32

    /**
     * A byte array that contains one of the following:
     * 
     * <ul>
     * <li>The CLSID of the Media Foundation transform (MFT) that represents the hardware codec.</li>
     * <li>A null-terminated, wide-character string that contains the symbolic link for the hardware codec. Include the size of the terminating null in the value of the <b>cbVerifier</b> member. </li>
     * </ul>
     */
    Verifier : Int8[4052]

}
