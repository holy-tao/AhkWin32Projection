#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class HANDEDNESS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static HANDEDNESS_LEFT => 0

    /**
     * @type {Integer (Int32)}
     */
    static HANDEDNESS_RIGHT => 1
}
