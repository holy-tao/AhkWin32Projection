#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class PAGESETUPDLG_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_DEFAULTMINMARGINS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_DISABLEMARGINS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_DISABLEORIENTATION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_DISABLEPAGEPAINTING => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_DISABLEPAPER => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_DISABLEPRINTER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_ENABLEPAGEPAINTHOOK => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_ENABLEPAGESETUPHOOK => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_ENABLEPAGESETUPTEMPLATE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_ENABLEPAGESETUPTEMPLATEHANDLE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_INHUNDREDTHSOFMILLIMETERS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_INTHOUSANDTHSOFINCHES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_INWININIINTLMEASURE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_MARGINS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_MINMARGINS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_NONETWORKBUTTON => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_NOWARNING => 128

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_RETURNDEFAULT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PSD_SHOWHELP => 2048
}
