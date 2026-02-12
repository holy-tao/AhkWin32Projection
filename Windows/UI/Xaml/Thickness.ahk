#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Describes the thickness of a frame around a rectangle. Four [Double](/dotnet/api/system.double?view=dotnet-uwp-10.0&preserve-view=true) values describe the **Left**, **Top**, **Right**, and **Bottom** sides of the rectangle, respectively.
 * @remarks
 * Thickness values are generally used to set properties that affect the layout of the object where the property is set. Properties that use a Thickness value include:
 * 
 * + [FrameworkElement.Margin](frameworkelement_margin.md)
 * + [Control.Padding](../windows.ui.xaml.controls/control_padding.md)
 * + [Border.BorderThickness](../windows.ui.xaml.controls/border_borderthickness.md) and [Control.BorderThickness](../windows.ui.xaml.controls/control_borderthickness.md)
 * + Other **Margin** and **Padding** properties on classes that are not a [Control](../windows.ui.xaml.controls/control.md), for example [RichTextBlock.Padding](../windows.ui.xaml.controls/richtextblock_padding.md)
 * + [Image.NineGrid](../windows.ui.xaml.controls/image_ninegrid.md)
 * + [Shape.StrokeThickness](../windows.ui.xaml.shapes/shape_strokethickness.md)
 * + [ProgressBarTemplateSettings.EllipseOffset](../windows.ui.xaml.controls.primitives/progressbartemplatesettings_ellipseoffset.md)
 * 
 * In XAML, you can specify Thickness values in several ways. If you specify four **Double** values, these represent the [Left](/uwp/api/windows.ui.xaml.thickness.left), [Top](/uwp/api/windows.ui.xaml.thickness.top), [Right](/uwp/api/windows.ui.xaml.thickness.right), and [Bottom](/uwp/api/windows.ui.xaml.thickness.bottom) sides, respectively, of the bounding rectangle. If you specify two values, these represent the **Left**, **Top** values, and also applies the same values to **Right** and **Bottom** such that the resulting Thickness is isometric horizontally and isometric vertically. You can also supply a single value, which applies a uniform value to all four sides of the bounding rectangle.
 * 
 * Values assigned from code do not have any behavior that can extrapolate values. If you set the value for a **Left** property or field, you do not automatically establish the same value for **Right**. All Thickness properties must be set discretely in code. You can use the [Thickness(Double)](/dotnet/api/windows.ui.xaml.thickness.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_Thickness__ctor_System_Double_) or [Thickness(Double,Double,Double,Double)](/dotnet/api/windows.ui.xaml.thickness.-ctor?view=dotnet-uwp-10.0&preserve-view=true#Windows_UI_Xaml_Thickness__ctor_System_Double_System_Double_System_Double_System_Double_) constructors rather than assigning values to properties.
 * 
 * Although the type of the data values of a Thickness is **Double**, you typically specify integer values.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.thickness
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Thickness extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The left side measure of the Thickness.
     * @type {Float}
     */
    Left {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * The top edge measure of the Thickness.
     * @type {Float}
     */
    Top {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }

    /**
     * The right side measure of the Thickness.
     * @type {Float}
     */
    Right {
        get => NumGet(this, 16, "double")
        set => NumPut("double", value, this, 16)
    }

    /**
     * The bottom edge measure of the Thickness.
     * @type {Float}
     */
    Bottom {
        get => NumGet(this, 24, "double")
        set => NumPut("double", value, this, 24)
    }
}
