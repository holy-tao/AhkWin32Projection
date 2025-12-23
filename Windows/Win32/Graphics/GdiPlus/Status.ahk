#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * This section lists the styles, in addition to standard window styles, supported by status bar controls.
 * @see https://learn.microsoft.com/windows/win32/Controls/status-bar-styles
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class Status extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ok => 0

    /**
     * @type {Integer (Int32)}
     */
    static GenericError => 1

    /**
     * @type {Integer (Int32)}
     */
    static InvalidParameter => 2

    /**
     * @type {Integer (Int32)}
     */
    static OutOfMemory => 3

    /**
     * @type {Integer (Int32)}
     */
    static ObjectBusy => 4

    /**
     * @type {Integer (Int32)}
     */
    static InsufficientBuffer => 5

    /**
     * @type {Integer (Int32)}
     */
    static NotImplemented => 6

    /**
     * @type {Integer (Int32)}
     */
    static Win32Error => 7

    /**
     * @type {Integer (Int32)}
     */
    static WrongState => 8

    /**
     * @type {Integer (Int32)}
     */
    static Aborted => 9

    /**
     * @type {Integer (Int32)}
     */
    static FileNotFound => 10

    /**
     * @type {Integer (Int32)}
     */
    static ValueOverflow => 11

    /**
     * @type {Integer (Int32)}
     */
    static AccessDenied => 12

    /**
     * @type {Integer (Int32)}
     */
    static UnknownImageFormat => 13

    /**
     * @type {Integer (Int32)}
     */
    static FontFamilyNotFound => 14

    /**
     * @type {Integer (Int32)}
     */
    static FontStyleNotFound => 15

    /**
     * @type {Integer (Int32)}
     */
    static NotTrueTypeFont => 16

    /**
     * @type {Integer (Int32)}
     */
    static UnsupportedGdiplusVersion => 17

    /**
     * @type {Integer (Int32)}
     */
    static GdiplusNotInitialized => 18

    /**
     * @type {Integer (Int32)}
     */
    static PropertyNotFound => 19

    /**
     * @type {Integer (Int32)}
     */
    static PropertyNotSupported => 20

    /**
     * @type {Integer (Int32)}
     */
    static ProfileNotFound => 21
}
