#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class SOUNDSENTRY_WINDOWS_EFFECT extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_CUSTOM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_DISPLAY => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_TITLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SSWF_WINDOW => 2
}
