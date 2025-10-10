#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates information about the features accessed during an instant messaging interaction.
 * @see https://docs.microsoft.com/windows/win32/api//wpcevent/ne-wpcevent-wpcflag_im_feature
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class WPCFLAG_IM_FEATURE{

    /**
     * No instant messaging features were used.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_NONE => 0

    /**
     * The video feature was used during the instant messaging session.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_VIDEO => 1

    /**
     * The audio feature was used during the instant messaging session.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_AUDIO => 2

    /**
     * The game feature was used during the instant messaging session.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_GAME => 4

    /**
     * The short message service feature was used during the instant messaging session.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_SMS => 8

    /**
     * Files were swapped during the instant messaging session.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_FILESWAP => 16

    /**
     * URL or website locations were swapped during the instant messaging session.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_URLSWAP => 32

    /**
     * The top bit means sending or receiving.
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_SENDING => -2147483648

    /**
     * All features were used during the instant messaging session
     * @type {Integer (Int32)}
     */
    static WPCFLAG_IM_FEATURE_ALL => -1
}
