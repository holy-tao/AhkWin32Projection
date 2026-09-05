#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class DebugEventLevel extends Win32Enum {

    /**
     * Native name: DebugEventLevelFatal
     * @type {Integer (Int32)}
     */
    static Fatal => 0

    /**
     * Native name: DebugEventLevelWarning
     * @type {Integer (Int32)}
     */
    static Warning => 1
}
