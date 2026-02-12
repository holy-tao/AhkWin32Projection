#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies how side bearing values in per-character typography are handled when aligning to a text container boundary.
 * @remarks
 * This enumeration is used as a value by [TextBlock.OpticalMarginAlignment](../windows.ui.xaml.controls/textblock_opticalmarginalignment.md) and [RichTextBlock.OpticalMarginAlignment](../windows.ui.xaml.controls/richtextblock_opticalmarginalignment.md).
 * 
 * When fonts of different sizes are aligned vertically in the same or nearby containers, the advance width and side bearing of the characters can cause the alignment to appear ragged. This can be prevented by setting a property that uses OpticalMarginAlignment to use the **TrimSideBearings** constant.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.opticalmarginalignment
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class OpticalMarginAlignment extends Win32Enum{

    /**
     * Use side bearings that come from font typography values. This is the default.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Don't use side bearings that come from font typography values, and align the side of the glyph to where the "ink" part of the glyph begins.
     * @type {Integer (Int32)}
     */
    static TrimSideBearings => 1
}
