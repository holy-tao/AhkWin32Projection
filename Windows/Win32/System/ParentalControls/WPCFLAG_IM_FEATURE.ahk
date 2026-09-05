#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates information about the features accessed during an instant messaging interaction.
 * @see https://learn.microsoft.com/windows/win32/api/wpcevent/ne-wpcevent-wpcflag_im_feature
 * @namespace Windows.Win32.System.ParentalControls
 */
class WPCFLAG_IM_FEATURE extends Win32Enum {

    /**
     * No instant messaging features were used.
     * Native name: WPCFLAG_IM_FEATURE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The video feature was used during the instant messaging session.
     * Native name: WPCFLAG_IM_FEATURE_VIDEO
     * @type {Integer (Int32)}
     */
    static VIDEO => 1

    /**
     * The audio feature was used during the instant messaging session.
     * Native name: WPCFLAG_IM_FEATURE_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 2

    /**
     * The game feature was used during the instant messaging session.
     * Native name: WPCFLAG_IM_FEATURE_GAME
     * @type {Integer (Int32)}
     */
    static GAME => 4

    /**
     * The short message service feature was used during the instant messaging session.
     * Native name: WPCFLAG_IM_FEATURE_SMS
     * @type {Integer (Int32)}
     */
    static SMS => 8

    /**
     * Files were swapped during the instant messaging session.
     * Native name: WPCFLAG_IM_FEATURE_FILESWAP
     * @type {Integer (Int32)}
     */
    static FILESWAP => 16

    /**
     * URL or website locations were swapped during the instant messaging session.
     * Native name: WPCFLAG_IM_FEATURE_URLSWAP
     * @type {Integer (Int32)}
     */
    static URLSWAP => 32

    /**
     * The top bit means sending or receiving.
     * Native name: WPCFLAG_IM_FEATURE_SENDING
     * @type {Integer (Int32)}
     */
    static SENDING => -2147483648

    /**
     * All features were used during the instant messaging session
     * Native name: WPCFLAG_IM_FEATURE_ALL
     * @type {Integer (Int32)}
     */
    static ALL => -1
}
