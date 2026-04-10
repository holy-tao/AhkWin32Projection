#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class BACKGROUNDSTATES extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static EBS_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static EBS_HOT => 2

    /**
     * @type {Integer (Int32)}
     */
    static EBS_DISABLED => 3

    /**
     * @type {Integer (Int32)}
     */
    static EBS_FOCUSED => 4

    /**
     * @type {Integer (Int32)}
     */
    static EBS_READONLY => 5

    /**
     * @type {Integer (Int32)}
     */
    static EBS_ASSIST => 6
}
