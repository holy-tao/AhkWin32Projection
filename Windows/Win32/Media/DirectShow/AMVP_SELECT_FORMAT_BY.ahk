#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the criteria that the Overlay Mixer Filter should use to select the video format.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ne-vptype-amvp_select_format_by
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AMVP_SELECT_FORMAT_BY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Format does not matter.
     * @type {Integer (Int32)}
     */
    static AMVP_DO_NOT_CARE => 0

    /**
     * Use the largest bandwidth.
     * @type {Integer (Int32)}
     */
    static AMVP_BEST_BANDWIDTH => 1

    /**
     * Use the same input format as output format.
     * @type {Integer (Int32)}
     */
    static AMVP_INPUT_SAME_AS_OUTPUT => 2
}
