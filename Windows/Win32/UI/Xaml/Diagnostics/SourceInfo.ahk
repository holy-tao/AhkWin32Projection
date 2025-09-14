#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Represents information about an object’s XAML source document.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-sourceinfo
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 * @version v4.0.30319
 */
class SourceInfo extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The name of the source document file where the element is declared.
     * @type {Pointer<BSTR>}
     */
    FileName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The line number in the source document where the element is declared.
     * @type {Integer}
     */
    LineNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The position on the line in the source document where the element is declared.
     * @type {Integer}
     */
    ColumnNumber {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The character position in the source document.
     * @type {Integer}
     */
    CharPosition {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The hash of the source document.
     * @type {Pointer<BSTR>}
     */
    Hash {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
