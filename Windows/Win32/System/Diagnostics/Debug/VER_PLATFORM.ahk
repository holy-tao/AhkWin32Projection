#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
class VER_PLATFORM extends Win32Enum {

    /**
     * Native name: VER_PLATFORM_WIN32s
     * @type {Integer (UInt32)}
     */
    static WIN32s => 0

    /**
     * Native name: VER_PLATFORM_WIN32_WINDOWS
     * @type {Integer (UInt32)}
     */
    static WIN32_WINDOWS => 1

    /**
     * Native name: VER_PLATFORM_WIN32_NT
     * @type {Integer (UInt32)}
     */
    static WIN32_NT => 2
}
