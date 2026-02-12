#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the text types supported for syndication content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationtexttype
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationTextType extends Win32Enum{

    /**
     * Plain text
     * @type {Integer (Int32)}
     */
    static Text => 0

    /**
     * HTML (escaped markup)
     * @type {Integer (Int32)}
     */
    static Html => 1

    /**
     * XML (not escaped)
     * @type {Integer (Int32)}
     */
    static Xhtml => 2
}
