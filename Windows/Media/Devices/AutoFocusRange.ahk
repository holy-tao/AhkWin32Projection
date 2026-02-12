#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the options for auto focus range.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.autofocusrange
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class AutoFocusRange extends Win32Enum{

    /**
     * Full range.
     * @type {Integer (Int32)}
     */
    static FullRange => 0

    /**
     * Macro.
     * @type {Integer (Int32)}
     */
    static Macro => 1

    /**
     * Normal range.
     * @type {Integer (Int32)}
     */
    static Normal => 2
}
