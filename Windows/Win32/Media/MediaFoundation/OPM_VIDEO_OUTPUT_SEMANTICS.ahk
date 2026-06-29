#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether the IOPMVideoOutput interface will use Output Protection Manager (OPM) semantics or Certified Output Protection Protocol (COPP) semantics.
 * @see https://learn.microsoft.com/windows/win32/api/opmapi/ne-opmapi-opm_video_output_semantics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct OPM_VIDEO_OUTPUT_SEMANTICS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
     * @type {Integer (Int32)}
     */
    static OPM_VOS_OPM_INDIRECT_DISPLAY => 2
}
