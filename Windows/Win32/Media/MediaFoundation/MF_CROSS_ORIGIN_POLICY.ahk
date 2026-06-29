#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Maps to the W3C cross origin settings (CORS) attribute used by the HTML5 media element.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_cross_origin_policy
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_CROSS_ORIGIN_POLICY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No CORS state.
     * @type {Integer (Int32)}
     */
    static MF_CROSS_ORIGIN_POLICY_NONE => 0

    /**
     * Requests for the element will have their mode set to "cors" and their credentials mode set to "same-origin".
     * @type {Integer (Int32)}
     */
    static MF_CROSS_ORIGIN_POLICY_ANONYMOUS => 1

    /**
     * Requests for the element will have their mode set to "cors" and their credentials mode set to "include".
     * @type {Integer (Int32)}
     */
    static MF_CROSS_ORIGIN_POLICY_USE_CREDENTIALS => 2
}
