#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SourceInfo.ahk" { SourceInfo }

/**
 * Represents a XAML element in the Live Visual Tree in Microsoft Visual Studio.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-visualelement
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct VisualElement {
    #StructPack 8

    /**
     * A handle to the object.
     */
    Handle : Int64

    /**
     * Information about the XAML source document.
     */
    SrcInfo : SourceInfo

    /**
     * The type of the object.
     */
    Type : BSTR

    /**
     * The name of the XAML element, if it has an <a href="https://docs.microsoft.com/windows/uwp/xaml-platform/x-name-attribute">x:Name</a> defined in markup.
     */
    Name : BSTR

    /**
     * The number of children the XAML element has.
     */
    NumChildren : UInt32

}
