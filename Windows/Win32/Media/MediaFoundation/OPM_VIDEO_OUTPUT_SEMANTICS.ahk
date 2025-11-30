#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether the IOPMVideoOutput interface will use Output Protection Manager (OPM) semantics or Certified Output Protection Protocol (COPP) semantics.
 * @see https://docs.microsoft.com/windows/win32/api//opmapi/ne-opmapi-opm_video_output_semantics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class OPM_VIDEO_OUTPUT_SEMANTICS extends Win32Enum{

    /**
     * The interface will use COPP semantics.
     * @type {Integer (Int32)}
     */
    static OPM_VOS_COPP_SEMANTICS => 0

    /**
     * The interface will use OPM semantics.
     * @type {Integer (Int32)}
     */
    static OPM_VOS_OPM_SEMANTICS => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OPM_VOS_OPM_INDIRECT_DISPLAY => 2
}
