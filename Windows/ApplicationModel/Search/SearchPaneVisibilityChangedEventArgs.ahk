#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPaneVisibilityChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for a [VisibilityChanged](searchpane_visibilitychanged.md) event that is associated with a [searchPane](searchpane.md) object.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * This object is passed to an app's [VisibilityChanged](searchpane_visibilitychanged.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanevisibilitychangedeventargs
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPaneVisibilityChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPaneVisibilityChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPaneVisibilityChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Indicates whether the search pane is open.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpanevisibilitychangedeventargs.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__ISearchPaneVisibilityChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchPaneVisibilityChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPaneVisibilityChangedEventArgs := ISearchPaneVisibilityChangedEventArgs(outPtr)
        }

        return this.__ISearchPaneVisibilityChangedEventArgs.get_Visible()
    }

;@endregion Instance Methods
}
