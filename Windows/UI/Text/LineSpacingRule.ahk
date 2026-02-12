#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies options for line-spacing rules.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.text.linespacingrule
 * @namespace Windows.UI.Text
 * @version WindowsRuntime 1.4
 */
class LineSpacingRule extends Win32Enum{

    /**
     * The line spacing is undefined.
     * @type {Integer (Int32)}
     */
    static Undefined => 0

    /**
     * Single space. The line-spacing value is ignored.
     * @type {Integer (Int32)}
     */
    static Single => 1

    /**
     * One-and-a-half line spacing. The line-spacing value is ignored.
     * @type {Integer (Int32)}
     */
    static OneAndHalf => 2

    /**
     * Double line spacing. The line-spacing value is ignored.
     * @type {Integer (Int32)}
     */
    static Double => 3

    /**
     * The line-spacing value specifies the spacing from one line to the next. However, if the value is less than single spacing, text is single spaced.
     * @type {Integer (Int32)}
     */
    static AtLeast => 4

    /**
     * The line-spacing value specifies the exact spacing from one line to the next, even if the value is less than single spacing.
     * @type {Integer (Int32)}
     */
    static Exactly => 5

    /**
     * The line-spacing value specifies the line spacing, in lines.
     * @type {Integer (Int32)}
     */
    static Multiple => 6

    /**
     * The line-spacing value specifies the line spacing by percent of line height. This option is not supported by Windows.UI.Xaml.Controls.RichEditBox. Setting it will always return an InvalidArgumentException.
     * @type {Integer (Int32)}
     */
    static Percent => 7
}
