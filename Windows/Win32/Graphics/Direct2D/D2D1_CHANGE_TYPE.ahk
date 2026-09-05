#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes flags that influence how the renderer interacts with a custom vertex shader. (D2D1_CHANGE_TYPE)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_change_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_CHANGE_TYPE extends Win32BitflagEnum {

    /**
     * There were no changes.
     * Native name: D2D1_CHANGE_TYPE_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * The properties of the effect changed.
     * Native name: D2D1_CHANGE_TYPE_PROPERTIES
     * @type {Integer (Int32)}
     */
    static PROPERTIES => 1

    /**
     * The context state changed.
     * Native name: D2D1_CHANGE_TYPE_CONTEXT
     * @type {Integer (Int32)}
     */
    static CONTEXT => 2

    /**
     * The effect’s transform graph has changed.  This happens only when an effect supports a variable input count.
     * Native name: D2D1_CHANGE_TYPE_GRAPH
     * @type {Integer (Int32)}
     */
    static GRAPH => 3
}
