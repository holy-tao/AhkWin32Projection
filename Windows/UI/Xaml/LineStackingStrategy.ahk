#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Describes the mechanism by which a line box is determined for each line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.linestackingstrategy
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class LineStackingStrategy extends Win32Enum{

    /**
     * The stack height is the minimum of the extended block progression dimension (height) of all the inline elements when properly aligned and the [LineHeight](../windows.ui.xaml.documents/block_lineheight.md) value, if specified.
     * @type {Integer (Int32)}
     */
    static MaxHeight => 0

    /**
     * The stack height is determined by the block element's [LineHeight](../windows.ui.xaml.documents/block_lineheight.md) property value.
     * @type {Integer (Int32)}
     */
    static BlockLineHeight => 1

    /**
     * The stack height is determined by adding [LineHeight](../windows.ui.xaml.documents/block_lineheight.md) to the baseline of the previous line.
     * @type {Integer (Int32)}
     */
    static BaselineToBaseline => 2
}
