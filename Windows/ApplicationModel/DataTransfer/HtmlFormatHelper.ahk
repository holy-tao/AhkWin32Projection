#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHtmlFormatHelperStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Responsible for formatting HTML content that you want to share or add to the Clipboard. Also allows you to get HTML fragments from the content.
 * @remarks
 * For more information on how to use this class, check out [DataPackage.SetHtmlFormat](datapackage_sethtmlformat_1162235403.md). You might also want to look at our topic, [How to share HTML](/previous-versions/windows/apps/hh758310(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.htmlformathelper
 * @namespace Windows.ApplicationModel.DataTransfer
 * @version WindowsRuntime 1.4
 */
class HtmlFormatHelper extends IInspectable {
;@region Static Methods
    /**
     * Gets a string that represents an HTML fragment.
     * @remarks
     * As a security precaution, you shouldn't display HTML unless you're sure it doesn't have any dynamic content. You can use the `GetStaticFragment` method to get shared HTML content without any dynamic elements such as script tags.
     * @param {HSTRING} htmlFormat The formatted HTML.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.htmlformathelper.getstaticfragment
     */
    static GetStaticFragment(htmlFormat) {
        if (!HtmlFormatHelper.HasProp("__IHtmlFormatHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.HtmlFormatHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHtmlFormatHelperStatics.IID)
            HtmlFormatHelper.__IHtmlFormatHelperStatics := IHtmlFormatHelperStatics(factoryPtr)
        }

        return HtmlFormatHelper.__IHtmlFormatHelperStatics.GetStaticFragment(htmlFormat)
    }

    /**
     * Takes a string that represents HTML content and adds the necessary headers to ensure it is formatted correctly for share and Clipboard operations.
     * @param {HSTRING} htmlFragment A string representing the HTML content.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.datatransfer.htmlformathelper.createhtmlformat
     */
    static CreateHtmlFormat(htmlFragment) {
        if (!HtmlFormatHelper.HasProp("__IHtmlFormatHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.DataTransfer.HtmlFormatHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHtmlFormatHelperStatics.IID)
            HtmlFormatHelper.__IHtmlFormatHelperStatics := IHtmlFormatHelperStatics(factoryPtr)
        }

        return HtmlFormatHelper.__IHtmlFormatHelperStatics.CreateHtmlFormat(htmlFragment)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
