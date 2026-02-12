#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Records error information produced by calls to [XamlBinaryWriter.Write](xamlbinarywriter_write_504090345.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.markup.xamlbinarywritererrorinformation
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class XamlBinaryWriterErrorInformation extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The index of the stream in the original *inputStreams* parameter for [XamlBinaryWriter.Write](xamlbinarywriter_write_504090345.md) where the error occurred.
     * @type {Integer}
     */
    InputStreamIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The line number in the input XAML text representation where the error was encountered.
     * @type {Integer}
     */
    LineNumber {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The line position in the input XAML text representation where the error was encountered.
     * @type {Integer}
     */
    LinePosition {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
