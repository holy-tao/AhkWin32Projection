#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class TRACK_POPUP_MENU_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_LEFTBUTTON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RIGHTBUTTON => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_LEFTALIGN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_CENTERALIGN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RIGHTALIGN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_TOPALIGN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VCENTERALIGN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_BOTTOMALIGN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_HORIZONTAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERTICAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_NONOTIFY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RETURNCMD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_RECURSE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_HORPOSANIMATION => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_HORNEGANIMATION => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERPOSANIMATION => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_VERNEGANIMATION => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_NOANIMATION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_LAYOUTRTL => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static TPM_WORKAREA => 65536
}
