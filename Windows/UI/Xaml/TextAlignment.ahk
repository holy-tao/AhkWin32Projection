#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies whether text is centered, left-aligned, or right-aligned.
 * @remarks
 * **DetectFromContent** is available starting with Windows 10. When the **TextAlignment** property is set to **DetectFromContent**, alignment is inferred from the text content of the control. For example, English text is left aligned, and Arabic text is right aligned.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.textalignment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TextAlignment extends Win32Enum{

    /**
     * Text is centered within the container.
     * @type {Integer (Int32)}
     */
    static Center => 0

    /**
     * Text is aligned to the left edge of the container.
     * @type {Integer (Int32)}
     */
    static Left => 1

    /**
     * The beginning of the text is aligned to the edge of the container.
     * @type {Integer (Int32)}
     */
    static Start => 1

    /**
     * Text is aligned to the right edge of the container.
     * @type {Integer (Int32)}
     */
    static Right => 2

    /**
     * The end of the text is aligned to the edge of the container.
     * @type {Integer (Int32)}
     */
    static End => 2

    /**
     * Text is justified within the container.
     * @type {Integer (Int32)}
     */
    static Justify => 3

    /**
     * Text alignment is inferred from the text content.
     * @type {Integer (Int32)}
     */
    static DetectFromContent => 4
}
