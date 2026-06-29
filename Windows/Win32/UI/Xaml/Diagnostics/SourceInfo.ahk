#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }

/**
 * Represents information about an object’s XAML source document.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-sourceinfo
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct SourceInfo {
    #StructPack 8

    /**
     * The name of the source document file where the element is declared.
     */
    FileName : BSTR

    /**
     * The line number in the source document where the element is declared.
     */
    LineNumber : UInt32

    /**
     * The position on the line in the source document where the element is declared.
     */
    ColumnNumber : UInt32

    /**
     * The character position in the source document.
     */
    CharPosition : UInt32

    /**
     * The hash of the source document.
     */
    Hash : BSTR

}
