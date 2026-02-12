#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Describes a color in terms of alpha, red, green, and blue channels.
 * @remarks
 * Color is a Windows Runtime structure that represents a color that has four channels: **A** (alpha), **R** (red), **G** (green), **B** (blue). Each of the values is stored as a **Byte** type with value 0-255.
 * 
 * Color values are used in these features and scenarios:
 * + Colors for start screens and general UI (for example [SecondaryTile.BackgroundColor](../windows.ui.startscreen/secondarytile_backgroundcolor.md) and [UISettings.UIElementColor](../windows.ui.viewmanagement/uisettings_uielementcolor_197668507.md)). These can be used in JavaScript.
 * + Color values for the Windows 8 ink system. Specifically, [InkDrawingAttributes.Color](../windows.ui.input.inking/inkdrawingattributes_color.md). This can be used in JavaScript.
 * + Color values for XAML UI and UWP app using C++, C#, or Visual Basic, particularly for brushes. These API can't be used in JavaScript.
 * + Defining color values that are used for interfaces representing text, in the [Windows.UI.Text](../windows.ui.text/windows_ui_text.md) namespace. These API can't be used in JavaScript.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.color
 * @namespace Windows.UI
 * @version WindowsRuntime 1.4
 */
class Color extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Gets or sets the **sRGB** alpha channel value of the color.
     * @type {Integer}
     */
    A {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Gets or sets the **sRGB** red channel value of the color.
     * @type {Integer}
     */
    R {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Gets or sets the **sRGB** green channel value of the color.
     * @type {Integer}
     */
    G {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * Gets or sets the **sRGB** blue channel value of the color.
     * @type {Integer}
     */
    B {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }
}
