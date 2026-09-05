#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
class CompositingMode extends Win32Enum {

    /**
     * Native name: CompositingModeSourceOver
     * @type {Integer (Int32)}
     */
    static SourceOver => 0

    /**
     * Native name: CompositingModeSourceCopy
     * @type {Integer (Int32)}
     */
    static SourceCopy => 1
}
