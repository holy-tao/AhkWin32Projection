#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes flags that influence how the renderer interacts with a custom vertex shader.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/ne-d2d1effectauthor-d2d1_change_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_CHANGE_TYPE extends Win32BitflagEnum{

    /**
     * There were no changes.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANGE_TYPE_NONE => 0

    /**
     * The properties of the effect changed.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANGE_TYPE_PROPERTIES => 1

    /**
     * The context state changed.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANGE_TYPE_CONTEXT => 2

    /**
     * The effect’s transform graph has changed.  This happens only when an effect supports a variable input count.
     * @type {Integer (Int32)}
     */
    static D2D1_CHANGE_TYPE_GRAPH => 3
}
