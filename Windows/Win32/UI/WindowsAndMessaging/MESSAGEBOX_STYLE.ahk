#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MESSAGEBOX_STYLE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ABORTRETRYIGNORE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MB_CANCELTRYCONTINUE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MB_HELP => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MB_OK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MB_OKCANCEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MB_RETRYCANCEL => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MB_YESNO => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MB_YESNOCANCEL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONHAND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONQUESTION => 32

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONEXCLAMATION => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONASTERISK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MB_USERICON => 128

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONWARNING => 48

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONINFORMATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONSTOP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DEFBUTTON1 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DEFBUTTON2 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DEFBUTTON3 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DEFBUTTON4 => 768

    /**
     * @type {Integer (UInt32)}
     */
    static MB_APPLMODAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MB_SYSTEMMODAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MB_TASKMODAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static MB_NOFOCUS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static MB_SETFOREGROUND => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DEFAULT_DESKTOP_ONLY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static MB_TOPMOST => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MB_RIGHT => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static MB_RTLREADING => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MB_SERVICE_NOTIFICATION => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static MB_SERVICE_NOTIFICATION_NT3X => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static MB_TYPEMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MB_ICONMASK => 240

    /**
     * @type {Integer (UInt32)}
     */
    static MB_DEFMASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static MB_MODEMASK => 12288

    /**
     * @type {Integer (UInt32)}
     */
    static MB_MISCMASK => 49152
}
