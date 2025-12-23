#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_DIGITAL_CP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static AM_DIGITAL_CP_OFF => 0

    /**
     * @type {Integer (Int32)}
     */
    static AM_DIGITAL_CP_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static AM_DIGITAL_CP_DVD_COMPLIANT => 2
}
