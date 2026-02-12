#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Represents a measurement for control logic that explicitly supports **Star** (\*) sizing and **Auto** sizing.
 * @remarks
 * Types such as [ColumnDefinition](../windows.ui.xaml.controls/columndefinition.md) and [RowDefinition](../windows.ui.xaml.controls/rowdefinition.md) use GridLength values for some of their properties ([ColumnDefinition.Width](../windows.ui.xaml.controls/columndefinition_width.md) and [RowDefinition.Height](../windows.ui.xaml.controls/rowdefinition_height.md)). These property values are used to support variable distribution of available space in layout containers such as [Grid](../windows.ui.xaml.controls/grid.md) (and also derived types of [Grid](../windows.ui.xaml.controls/grid.md) such as [VariableSizedWrapGrid](../windows.ui.xaml.controls/variablesizedwrapgrid.md)).
 * 
 * A GridLength can describe one of three modes for sizing:
 * 
 * - A fixed width.
 * - A weighted distribution (star sizing).
 * - An "Auto" sizing mode.
 * 
 * GridLength values are typically declared in XAML attribute syntax. In XAML, the weighted distribution is declared using a "\*" symbol, preceded by a number that declares the weighting factor to use for that GridLength. The weighted distribution option is also known as *star sizing*.
 * 
 * The data values held by a GridLength ([Value](/uwp/api/windows.ui.xaml.gridlength.value) and [GridUnitType](/uwp/api/windows.ui.xaml.gridlength.gridunittype)) are both read-only. If you want to change the value of a property that takes a GridLength at run time, you have to create a new value using one of the constructors and replace the previous value.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.gridlength
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class GridLength extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The measure for this GridLength, which is not necessarily a pixel measure.
     * @type {Float}
     */
    Value {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * A value of the [GridUnitType](gridunittype.md) enumeration that qualifies how **Value** is interpreted as a measure.
     * @type {Integer}
     */
    GridUnitType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
