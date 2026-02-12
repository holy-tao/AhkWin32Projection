#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchPane.ahk
#Include .\ISearchPaneStaticsWithHideThisApplication.ahk
#Include .\ISearchPaneStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SearchPane.ahk
#Include .\SearchPaneVisibilityChangedEventArgs.ahk
#Include .\SearchPaneQueryChangedEventArgs.ahk
#Include .\SearchPaneSuggestionsRequestedEventArgs.ahk
#Include .\SearchPaneQuerySubmittedEventArgs.ahk
#Include .\SearchPaneResultSuggestionChosenEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Deprecated. Use the [Windows.UI.Xaml.Controls.AutoSuggestBox](../windows.ui.xaml.controls/autosuggestbox.md) control instead. Represents and manages the search pane that opens when a user activates the Search charm.
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * > [!NOTE]
 * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
 * 
 * This object is available to apps that participate in the Search contract. In order to provide users with search results, you must add code to your Activated event handler that responds when your app is activated for search. To learn more about responding to [Search](../windows.applicationmodel.activation/activationkind.md) activation events, see [webUISearchActivatedEventArgs](../windows.ui.webui/webuisearchactivatedeventargs.md) (JavaScript) or [SearchActivatedEventArgs](../windows.applicationmodel.activation/searchactivatedeventargs.md) (C#/C++/VB).
 * 
 * You can see code examples that demonstrate how to respond to search events and manage the search pane in the [Search contract sample (Windows 8)](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/Search%20contract%20sample).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane
 * @namespace Windows.ApplicationModel.Search
 * @version WindowsRuntime 1.4
 */
class SearchPane extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchPane

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchPane.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Hides the current app's UI.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.hidethisapplication
     */
    static HideThisApplication() {
        if (!SearchPane.HasProp("__ISearchPaneStaticsWithHideThisApplication")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Search.SearchPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchPaneStaticsWithHideThisApplication.IID)
            SearchPane.__ISearchPaneStaticsWithHideThisApplication := ISearchPaneStaticsWithHideThisApplication(factoryPtr)
        }

        return SearchPane.__ISearchPaneStaticsWithHideThisApplication.HideThisApplication()
    }

    /**
     * Retrieves an instance of the search pane from which users can search within the app.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * @returns {SearchPane} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.getforcurrentview
     */
    static GetForCurrentView() {
        if (!SearchPane.HasProp("__ISearchPaneStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Search.SearchPane")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchPaneStatics.IID)
            SearchPane.__ISearchPaneStatics := ISearchPaneStatics(factoryPtr)
        }

        return SearchPane.__ISearchPaneStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates whether the user's previous searches with the app are automatically tracked and used to provide suggestions.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * You can set this property to false to opt out of automatic suggestions; your app can optionally provide its own suggestions to users instead. If you decide to have your app track its own search history, you should also give the user some control over their history through the Settings charm, like the ability to clear the history.
     * 
     * If you set this property while the search pane is open, the change won't take effect until the user enters the next character of their query.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.searchhistoryenabled
     * @type {Boolean} 
     */
    SearchHistoryEnabled {
        get => this.get_SearchHistoryEnabled()
        set => this.put_SearchHistoryEnabled(value)
    }

    /**
     * A string that identifies the context of the search and is used to store the user's search history with the app.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * The search history context string is used as a secondary key for storing search history (the primary key is the AppId). An app can use the search history context string to store different search histories based on the context of the application.
     * 
     * If you don't set this property, Windows assumes that all searches in your app occur in the same context. If you update this property while the search pane is open with suggestions showing, the changes won't take effect until the user enters the next character.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.searchhistorycontext
     * @type {HSTRING} 
     */
    SearchHistoryContext {
        get => this.get_SearchHistoryContext()
        set => this.put_SearchHistoryContext(value)
    }

    /**
     * The placeholder text in the search box when the user hasn't entered any characters.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * You can use the placeholder text to give the user an indication about what he or she can search for.
     * 
     * If the placeholder text is too long to fit in the search box, the system truncates the text without raising an exception.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * The current text in the search box of the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * You can get the query text at any time, even if the search pane isn't open.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * The Internet Engineering Task Force (IETF) language tag (BCP 47 standard) that identifies the language currently associated with the user's text input device.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Indicates whether the search pane is open.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.visible
     * @type {Boolean} 
     */
    Visible {
        get => this.get_Visible()
    }

    /**
     * Gets or sets whether the user can open the search pane by typing.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.showonkeyboardinput
     * @type {Boolean} 
     */
    ShowOnKeyboardInput {
        get => this.get_ShowOnKeyboardInput()
        set => this.put_ShowOnKeyboardInput(value)
    }

    /**
     * Fires when the user opens or closes the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * Register to be notified when this event fires by adding an event listener to the [searchPane](searchpane.md) and assigning a handler function for the event. You can access information about the event with the [searchPaneVisibilityChangedEventArgs](searchpanevisibilitychangedeventargs.md) object that is passed to your event handler.
     * @type {TypedEventHandler<SearchPane, SearchPaneVisibilityChangedEventArgs>}
    */
    OnVisibilityChanged {
        get {
            if(!this.HasProp("__OnVisibilityChanged")){
                this.__OnVisibilityChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3975ff72-971b-54b6-9b5f-cc442e2a87f0}"),
                    SearchPane,
                    SearchPaneVisibilityChangedEventArgs
                )
                this.__OnVisibilityChangedToken := this.add_VisibilityChanged(this.__OnVisibilityChanged.iface)
            }
            return this.__OnVisibilityChanged
        }
    }

    /**
     * Fires when the user changes the text in the search box.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * Register to be notified when this event fires by adding an event listener to the [searchPane](searchpane.md) and assigning a handler function for the event. You can access information about the event with the [searchPaneQueryChangedEventArgs](searchpanequerychangedeventargs.md) object that is passed to your event handler.
     * @type {TypedEventHandler<SearchPane, SearchPaneQueryChangedEventArgs>}
    */
    OnQueryChanged {
        get {
            if(!this.HasProp("__OnQueryChanged")){
                this.__OnQueryChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7ccd7da1-8767-5eef-972d-31d09f1bf308}"),
                    SearchPane,
                    SearchPaneQueryChangedEventArgs
                )
                this.__OnQueryChangedToken := this.add_QueryChanged(this.__OnQueryChanged.iface)
            }
            return this.__OnQueryChanged
        }
    }

    /**
     * Occurs when the user's query text changes and the app needs to provide new suggestions to display in the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * Suggestions can come from three sources: search history, local files, or from a source specified by the app. Suggestions are grouped by their source and display in the following order in the search pane: search history, local files, and then app-specified sources.
     * 
     * If your app participates in the Search contract and you want your app to display suggestions from sources that you specify, you must register a handler to respond when this event fires. In your SuggestionsRequested event handler, respond by obtaining suggestions and populating the [SearchSuggestionCollection](searchsuggestioncollection.md) based on the user's [SearchPaneSuggestionsRequestedEventArgs](searchpanesuggestionsrequestedeventargs.md).[QueryText](searchpanesuggestionsrequestedeventargs_querytext.md).
     * 
     * > [!NOTE]
     * > If you want to respond to this event asynchronously, you must use [SearchPaneSuggestionsRequestedEventArgs](searchpanesuggestionsrequestedeventargs.md).[Request](searchpanesuggestionsrequestedeventargs_request.md).[GetDeferral](searchpanesuggestionsrequest_getdeferral_254836512.md).
     * 
     * Suggestions can't be provided for an empty search box, so this event isn't fired when the user updates the search box to be empty.
     * @type {TypedEventHandler<SearchPane, SearchPaneSuggestionsRequestedEventArgs>}
    */
    OnSuggestionsRequested {
        get {
            if(!this.HasProp("__OnSuggestionsRequested")){
                this.__OnSuggestionsRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{95088dc0-6c14-55b8-8a8f-9df1ca44d1d4}"),
                    SearchPane,
                    SearchPaneSuggestionsRequestedEventArgs
                )
                this.__OnSuggestionsRequestedToken := this.add_SuggestionsRequested(this.__OnSuggestionsRequested.iface)
            }
            return this.__OnSuggestionsRequested
        }
    }

    /**
     * Fires when the user submits the text in the search box and the app needs to display search results.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * If your app participates in the Search contract, register an event handler to respond when this event fires. In your QuerySubmitted event handler, respond by taking the user to your search results page and populating it with results based on the [SearchPaneQuerySubmittedEventArgs](searchpanequerysubmittedeventargs.md).[QueryText](searchpanequerysubmittedeventargs_querytext.md).
     * @type {TypedEventHandler<SearchPane, SearchPaneQuerySubmittedEventArgs>}
    */
    OnQuerySubmitted {
        get {
            if(!this.HasProp("__OnQuerySubmitted")){
                this.__OnQuerySubmitted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5f05121b-61a6-5f6b-b007-20816dfe7009}"),
                    SearchPane,
                    SearchPaneQuerySubmittedEventArgs
                )
                this.__OnQuerySubmittedToken := this.add_QuerySubmitted(this.__OnQuerySubmitted.iface)
            }
            return this.__OnQuerySubmitted
        }
    }

    /**
     * Fires when the user selects one of the suggested results that was provided by the app and displayed in the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * If your app participates in the Search contract and displays suggestions for possible results in the search pane, you should register an event handler to respond when this event fires. In your ResultSuggestionChosen event handler, respond by getting the [SearchPaneResultSuggestionChosenEventArgs](searchpaneresultsuggestionchoseneventargs.md).[Tag](searchpaneresultsuggestionchoseneventargs_tag.md) of the chosen result and using it to take the user to the result in your app UI.
     * 
     * > [!NOTE]
     * > If you want to display result suggestions, you must also listen for and handle the [SuggestionsRequested](searchpane_suggestionsrequested.md) event.
     * @type {TypedEventHandler<SearchPane, SearchPaneResultSuggestionChosenEventArgs>}
    */
    OnResultSuggestionChosen {
        get {
            if(!this.HasProp("__OnResultSuggestionChosen")){
                this.__OnResultSuggestionChosen := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{ec31e5d4-3b8c-5757-96bf-14096be946cd}"),
                    SearchPane,
                    SearchPaneResultSuggestionChosenEventArgs
                )
                this.__OnResultSuggestionChosenToken := this.add_ResultSuggestionChosen(this.__OnResultSuggestionChosen.iface)
            }
            return this.__OnResultSuggestionChosen
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnVisibilityChangedToken")) {
            this.remove_VisibilityChanged(this.__OnVisibilityChangedToken)
            this.__OnVisibilityChanged.iface.Dispose()
        }

        if(this.HasProp("__OnQueryChangedToken")) {
            this.remove_QueryChanged(this.__OnQueryChangedToken)
            this.__OnQueryChanged.iface.Dispose()
        }

        if(this.HasProp("__OnSuggestionsRequestedToken")) {
            this.remove_SuggestionsRequested(this.__OnSuggestionsRequestedToken)
            this.__OnSuggestionsRequested.iface.Dispose()
        }

        if(this.HasProp("__OnQuerySubmittedToken")) {
            this.remove_QuerySubmitted(this.__OnQuerySubmittedToken)
            this.__OnQuerySubmitted.iface.Dispose()
        }

        if(this.HasProp("__OnResultSuggestionChosenToken")) {
            this.remove_ResultSuggestionChosen(this.__OnResultSuggestionChosenToken)
            this.__OnResultSuggestionChosen.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SearchHistoryEnabled(value) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.put_SearchHistoryEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SearchHistoryEnabled() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_SearchHistoryEnabled()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SearchHistoryContext(value) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.put_SearchHistoryContext(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SearchHistoryContext() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_SearchHistoryContext()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_PlaceholderText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_QueryText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_Language()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Visible() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_Visible()
    }

    /**
     * 
     * @param {TypedEventHandler<SearchPane, SearchPaneVisibilityChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VisibilityChanged(handler) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.add_VisibilityChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VisibilityChanged(token) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.remove_VisibilityChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchPane, SearchPaneQueryChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QueryChanged(handler) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.add_QueryChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QueryChanged(token) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.remove_QueryChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchPane, SearchPaneSuggestionsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SuggestionsRequested(handler) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.add_SuggestionsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SuggestionsRequested(token) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.remove_SuggestionsRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchPane, SearchPaneQuerySubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuerySubmitted(handler) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.add_QuerySubmitted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QuerySubmitted(token) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.remove_QuerySubmitted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchPane, SearchPaneResultSuggestionChosenEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResultSuggestionChosen(handler) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.add_ResultSuggestionChosen(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ResultSuggestionChosen(token) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.remove_ResultSuggestionChosen(token)
    }

    /**
     * Specifies whether suggestions based on local files are automatically displayed in the search pane, and defines the criteria that Windows uses to locate and filter these suggestions.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * When local content suggestions are enabled, Windows will provide search suggestions from the user's local files as the user enters query text. For example, a picture application can configure local content suggestions so that search suggestions come only from a particular kind of image file that is stored in the user's picture library.
     * @param {LocalContentSuggestionSettings} settings The new settings for local content suggestions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.setlocalcontentsuggestionsettings
     */
    SetLocalContentSuggestionSettings(settings) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.SetLocalContentSuggestionSettings(settings)
    }

    /**
     * Shows the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * If the search pane is already being shown, this function gives focus to the search pane.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.show
     */
    ShowOverloadDefault() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.ShowOverloadDefault()
    }

    /**
     * Shows the search pane with the specified initial query string.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * If the search pane is already being shown, this function gives focus to the search pane.
     * @param {HSTRING} query The initial query string.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.show
     */
    ShowOverloadWithQuery(query) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.ShowOverloadWithQuery(query)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowOnKeyboardInput(value) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.put_ShowOnKeyboardInput(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowOnKeyboardInput() {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.get_ShowOnKeyboardInput()
    }

    /**
     * Attempts to set the text in the search box of the search pane.
     * @remarks
     * > [!IMPORTANT]
     * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
     * >
     * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
     * 
     * > [!NOTE]
     * > An app can't use both the search box ([Windows.UI.Xaml.Controls.SearchBox](../windows.ui.xaml.controls/searchbox.md)/[WinJS.UI.SearchBox](/previous-versions/windows/apps/dn301949(v=win.10))) and the SearchPane. Using both the search box and the search pane in the same app causes the app to throw an exception with this message: "Cannot create instance of type 'Windows.UI.Xaml.Controls.SearchBox.'"
     * 
     * If you have an in-app search box, use this method to maintain consistency between the search pane and your search box. Most apps should reply on the search pane instead of using in-app search UI.
     * @param {HSTRING} query The query text to show in the search pane's search box.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.search.searchpane.trysetquerytext
     */
    TrySetQueryText(query) {
        if (!this.HasProp("__ISearchPane")) {
            if ((queryResult := this.QueryInterface(ISearchPane.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchPane := ISearchPane(outPtr)
        }

        return this.__ISearchPane.TrySetQueryText(query)
    }

;@endregion Instance Methods
}
