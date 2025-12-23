#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class VER_PLATFORM extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORM_WIN32s => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORM_WIN32_WINDOWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORM_WIN32_NT => 2
}
