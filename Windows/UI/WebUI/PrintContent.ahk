#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the content that [HtmlPrintDocumentSource.content](htmlprintdocumentsource_content.md) prints.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.printcontent
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class PrintContent extends Win32Enum{

    /**
     * Print all pages.
     * @type {Integer (Int32)}
     */
    static AllPages => 0

    /**
     * Print the current page.
     * @type {Integer (Int32)}
     */
    static CurrentPage => 1

    /**
     * Print a custom page range.
     * @type {Integer (Int32)}
     */
    static CustomPageRange => 2

    /**
     * Print the current selection of pages.
     * @type {Integer (Int32)}
     */
    static CurrentSelection => 3
}
