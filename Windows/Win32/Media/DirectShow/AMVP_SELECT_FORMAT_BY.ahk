#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the criteria that the Overlay Mixer Filter should use to select the video format.
 * @see https://learn.microsoft.com/windows/win32/api/vptype/ne-vptype-amvp_select_format_by
 * @namespace Windows.Win32.Media.DirectShow
 */
class AMVP_SELECT_FORMAT_BY extends Win32Enum {

    /**
     * Format does not matter.
     * Native name: AMVP_DO_NOT_CARE
     * @type {Integer (Int32)}
     */
    static DO_NOT_CARE => 0

    /**
     * Use the largest bandwidth.
     * Native name: AMVP_BEST_BANDWIDTH
     * @type {Integer (Int32)}
     */
    static BEST_BANDWIDTH => 1

    /**
     * Use the same input format as output format.
     * Native name: AMVP_INPUT_SAME_AS_OUTPUT
     * @type {Integer (Int32)}
     */
    static INPUT_SAME_AS_OUTPUT => 2
}
