#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the collection mode for drawn ink-whether ink collection is disabled, ink is collected, or ink and gestures are collected.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-inkmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkMode extends Win32Enum{

    /**
     * Ink collection is disabled. No strokes are created when in this mode.
     * @type {Integer (Int32)}
     */
    static IEM_Disabled => 0

    /**
     * Ink only is collected, creating a stroke.
     * @type {Integer (Int32)}
     */
    static IEM_Ink => 1

    /**
     * Default. Ink is collected and single-stroke gestures are accepted.
     * @type {Integer (Int32)}
     */
    static IEM_InkAndGesture => 2
}
