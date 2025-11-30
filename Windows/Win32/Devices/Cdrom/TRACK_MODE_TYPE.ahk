#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Cdrom
 * @version v4.0.30319
 */
class TRACK_MODE_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static YellowMode2 => 0

    /**
     * @type {Integer (Int32)}
     */
    static XAForm2 => 1

    /**
     * @type {Integer (Int32)}
     */
    static CDDA => 2

    /**
     * @type {Integer (Int32)}
     */
    static RawWithC2AndSubCode => 3

    /**
     * @type {Integer (Int32)}
     */
    static RawWithC2 => 4

    /**
     * @type {Integer (Int32)}
     */
    static RawWithSubCode => 5
}
