#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\SourceInfo.ahk" { SourceInfo }
#Import ".\BaseValueSource.ahk" { BaseValueSource }

/**
 * Represents the source object (a Style) of a target type.
 * @see https://learn.microsoft.com/windows/win32/api/xamlom/ns-xamlom-propertychainsource
 * @namespace Windows.Win32.UI.Xaml.Diagnostics
 */
export default struct PropertyChainSource {
    #StructPack 8

    /**
     * A handle to the style.
     */
    Handle : Int64

    /**
     * The target type of the style, defined in markup.
     */
    TargetType : BSTR

    /**
     * The name of the style, if it has an <a href="https://docs.microsoft.com/windows/uwp/xaml-platform/x-name-attribute">x:Name</a> defined in markup.
     */
    Name : BSTR

    /**
     * Where the style is defined in the application .
     */
    Source : BaseValueSource

    SrcInfo : SourceInfo

}
