#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\OPM_RANDOM_NUMBER.ahk" { OPM_RANDOM_NUMBER }

/**
 * OPM_GET_CODEC_INFO_INFORMATION (opmapi.h) contains the result from an OPM_GET_CODEC_INFO query.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ns-opmapi-opm_get_codec_info_information
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_GET_CODEC_INFO_INFORMATION {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_random_number">OPM_RANDOM_NUMBER</a> structure. This structure contains the same 128-bit random number that the application sent to the driver in the <a href="https://docs.microsoft.com/windows/desktop/api/ksopmapi/ns-ksopmapi-opm_get_info_parameters">OPM_GET_INFO_PARAMETERS</a> structure.
     */
    rnRandomNumber : OPM_RANDOM_NUMBER

    /**
     * The merit value of the codec.
     */
    Merit : UInt32

}
