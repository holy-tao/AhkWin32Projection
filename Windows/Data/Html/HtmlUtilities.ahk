#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHtmlUtilities.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides utility methods for use with HTML-formatted data.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.data.html.htmlutilities
 * @namespace Windows.Data.Html
 * @version WindowsRuntime 1.4
 */
class HtmlUtilities extends IInspectable {
;@region Static Methods
    /**
     * Converts HTML-formatted data to a string that contains the text content extracted from the HTML.
     * @remarks
     * The ConvertToText method is used to convert HTML-formatted data to a text string. The HTML-formatted data could represent an HTML document or an HTML fragment. When the ConvertToText method parses the HTML-formatted data, no scripts are run and no secondary downloads occur (scripts, images, and stylesheets, for example).
     * 
     * The ConvertToText method will only parse HTML-formatted data to extract the text. If the *html* parameter contains a non-HTML string (XML or SVG, for example), then the return value will contain an empty string. If the *html* parameter contains a string that represents an HTML Frameset document, then the return value will contain an empty string.
     * @param {HSTRING} html A [String](/dotnet/api/system.string?view=dotnet-uwp-10.0&preserve-view=true) containing HTML-formatted data.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.data.html.htmlutilities.converttotext
     */
    static ConvertToText(html) {
        if (!HtmlUtilities.HasProp("__IHtmlUtilities")) {
            activatableClassId := HSTRING.Create("Windows.Data.Html.HtmlUtilities")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHtmlUtilities.IID)
            HtmlUtilities.__IHtmlUtilities := IHtmlUtilities(factoryPtr)
        }

        return HtmlUtilities.__IHtmlUtilities.ConvertToText(html)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
