#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Maps to the W3C cross origin settings (CORS) attribute used by the HTML5 media element.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mf_cross_origin_policy
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MF_CROSS_ORIGIN_POLICY extends Win32Enum {

    /**
     * No CORS state.
     * Native name: MF_CROSS_ORIGIN_POLICY_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Requests for the element will have their mode set to "cors" and their credentials mode set to "same-origin".
     * Native name: MF_CROSS_ORIGIN_POLICY_ANONYMOUS
     * @type {Integer (Int32)}
     */
    static ANONYMOUS => 1

    /**
     * Requests for the element will have their mode set to "cors" and their credentials mode set to "include".
     * Native name: MF_CROSS_ORIGIN_POLICY_USE_CREDENTIALS
     * @type {Integer (Int32)}
     */
    static USE_CREDENTIALS => 2
}
