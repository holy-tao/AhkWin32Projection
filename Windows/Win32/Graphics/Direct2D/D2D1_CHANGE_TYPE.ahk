#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes flags that influence how the renderer interacts with a custom vertex shader. (D2D1_CHANGE_TYPE)
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_change_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_CHANGE_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
