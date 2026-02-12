#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the basis of the page count.
 * @remarks
 * During print preview, call [SetPreviewPageCount](printdocument_setpreviewpagecount_804693784.md) with the value **PreviewPageCountType.Intermediate**. This way, the print preview can show the first page while the app calculates the rest of the pages. If the actual page count to be printed is known, pass **PreviewPageCountType.Final**. When **PreviewPageCountType.Final** is passed to **SetPreviewPageCount**, [SetJobPageCount](/previous-versions/jj553558(v=vs.85)) method is called with the total number of pages.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.printing.previewpagecounttype
 * @namespace Windows.UI.Xaml.Printing
 * @version WindowsRuntime 1.4
 */
class PreviewPageCountType extends Win32Enum{

    /**
     * Page count is based on final print job total.
     * @type {Integer (Int32)}
     */
    static Final => 0

    /**
     * Page count is based on an intermediate total.
     * @type {Integer (Int32)}
     */
    static Intermediate => 1
}
