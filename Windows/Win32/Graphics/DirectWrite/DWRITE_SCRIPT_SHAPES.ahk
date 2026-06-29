#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates additional shaping requirements for text.
 * @see https://learn.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_script_shapes
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_SCRIPT_SHAPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that there is no additional shaping requirements for text. Text is shaped with the writing system default behavior.
     * @type {Integer (Int32)}
     */
    static DWRITE_SCRIPT_SHAPES_DEFAULT => 0

    /**
     * Indicates that text should leave no visible control or format control characters.
     * @type {Integer (Int32)}
     */
    static DWRITE_SCRIPT_SHAPES_NO_VISUAL => 1
}
