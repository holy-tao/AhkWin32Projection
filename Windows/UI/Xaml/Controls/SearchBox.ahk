#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Control.ahk
#Include .\ISearchBox.ahk
#Include .\ISearchBoxFactory.ahk
#Include .\ISearchBoxStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SearchBox.ahk
#Include .\SearchBoxQueryChangedEventArgs.ahk
#Include .\SearchBoxSuggestionsRequestedEventArgs.ahk
#Include .\SearchBoxQuerySubmittedEventArgs.ahk
#Include .\SearchBoxResultSuggestionChosenEventArgs.ahk
#Include ..\RoutedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that can be used to enter search query text. (Not recommended for Universal Windows Platform (UWP) apps. See [AutoSuggestBox](autosuggestbox.md).)
 * @remarks
 * Use [AutoSuggestBox](autosuggestbox.md) for search.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class SearchBox extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchBox

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchBox.IID

    /**
     * Identifies the [SearchHistoryEnabled](searchbox_searchhistoryenabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.searchhistoryenabledproperty
     * @type {DependencyProperty} 
     */
    static SearchHistoryEnabledProperty {
        get => SearchBox.get_SearchHistoryEnabledProperty()
    }

    /**
     * Identifies the [SearchHistoryContext](searchbox_searchhistorycontext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.searchhistorycontextproperty
     * @type {DependencyProperty} 
     */
    static SearchHistoryContextProperty {
        get => SearchBox.get_SearchHistoryContextProperty()
    }

    /**
     * Identifies the [PlaceholderText](searchbox_placeholdertext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.placeholdertextproperty
     * @type {DependencyProperty} 
     */
    static PlaceholderTextProperty {
        get => SearchBox.get_PlaceholderTextProperty()
    }

    /**
     * Identifies the [QueryText](searchbox_querytext.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.querytextproperty
     * @type {DependencyProperty} 
     */
    static QueryTextProperty {
        get => SearchBox.get_QueryTextProperty()
    }

    /**
     * Identifies the [FocusOnKeyboardInput](searchbox_focusonkeyboardinput.md) dependency property.
     * @remarks
     * > [!NOTE]
     * > When FocusOnKeyboardInput is set to true, there’s an issue that sometimes causes users to see duplicate characters in the SearchBox control when using the touch keyboard. You can work around the issue by following these steps: 1. Register for the PrepareForFocusOnKeyboardInput event and use the event handler to set FocusOnKeyboardInput to false. 2. Register for the LostFocus event and use the event handler to set FocusOnKeyboardInput back to true.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.focusonkeyboardinputproperty
     * @type {DependencyProperty} 
     */
    static FocusOnKeyboardInputProperty {
        get => SearchBox.get_FocusOnKeyboardInputProperty()
    }

    /**
     * Identifies the [ChooseSuggestionOnEnter](searchbox_choosesuggestiononenter.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.choosesuggestiononenterproperty
     * @type {DependencyProperty} 
     */
    static ChooseSuggestionOnEnterProperty {
        get => SearchBox.get_ChooseSuggestionOnEnterProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {SearchBox} 
     */
    static CreateInstance() {
        if (!SearchBox.HasProp("__ISearchBoxFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxFactory.IID)
            SearchBox.__ISearchBoxFactory := ISearchBoxFactory(factoryPtr)
        }

        return SearchBox.__ISearchBoxFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SearchHistoryEnabledProperty() {
        if (!SearchBox.HasProp("__ISearchBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxStatics.IID)
            SearchBox.__ISearchBoxStatics := ISearchBoxStatics(factoryPtr)
        }

        return SearchBox.__ISearchBoxStatics.get_SearchHistoryEnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SearchHistoryContextProperty() {
        if (!SearchBox.HasProp("__ISearchBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxStatics.IID)
            SearchBox.__ISearchBoxStatics := ISearchBoxStatics(factoryPtr)
        }

        return SearchBox.__ISearchBoxStatics.get_SearchHistoryContextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_PlaceholderTextProperty() {
        if (!SearchBox.HasProp("__ISearchBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxStatics.IID)
            SearchBox.__ISearchBoxStatics := ISearchBoxStatics(factoryPtr)
        }

        return SearchBox.__ISearchBoxStatics.get_PlaceholderTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_QueryTextProperty() {
        if (!SearchBox.HasProp("__ISearchBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxStatics.IID)
            SearchBox.__ISearchBoxStatics := ISearchBoxStatics(factoryPtr)
        }

        return SearchBox.__ISearchBoxStatics.get_QueryTextProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_FocusOnKeyboardInputProperty() {
        if (!SearchBox.HasProp("__ISearchBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxStatics.IID)
            SearchBox.__ISearchBoxStatics := ISearchBoxStatics(factoryPtr)
        }

        return SearchBox.__ISearchBoxStatics.get_FocusOnKeyboardInputProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChooseSuggestionOnEnterProperty() {
        if (!SearchBox.HasProp("__ISearchBoxStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.SearchBox")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISearchBoxStatics.IID)
            SearchBox.__ISearchBoxStatics := ISearchBoxStatics(factoryPtr)
        }

        return SearchBox.__ISearchBoxStatics.get_ChooseSuggestionOnEnterProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that determines whether search suggestions are made from the search history.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.searchhistoryenabled
     * @type {Boolean} 
     */
    SearchHistoryEnabled {
        get => this.get_SearchHistoryEnabled()
        set => this.put_SearchHistoryEnabled(value)
    }

    /**
     * Gets or sets a string that identifies the context of the search and is used to store the user's search history with the app.
     * @remarks
     * The search history context string is used as a secondary key for storing search history. The primary key is the [AppId](../windows.applicationmodel.store/currentapp_appid.md). You can use the search history context string to store different search histories for different pages or search entry points in the app. If you don't set this property, Windows assumes that all searches in your app occur in the same context.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.searchhistorycontext
     * @type {HSTRING} 
     */
    SearchHistoryContext {
        get => this.get_SearchHistoryContext()
        set => this.put_SearchHistoryContext(value)
    }

    /**
     * Gets or sets the text that is displayed in the control until the value is changed by a user action or some other operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.placeholdertext
     * @type {HSTRING} 
     */
    PlaceholderText {
        get => this.get_PlaceholderText()
        set => this.put_PlaceholderText(value)
    }

    /**
     * Gets or sets the text contents of the search box.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
        set => this.put_QueryText(value)
    }

    /**
     * Gets or sets a value that determines whether a user can search by typing anywhere in the app.
     * @remarks
     * > [!NOTE]
     * > When FocusOnKeyboardInput is set to **true**, there’s an issue that sometimes creates duplicate characters in the [SearchBox](searchbox.md) control when using the touch keyboard. You can work around the issue by following these steps:
     * 
     * 1. Disable FocusOnKeyboardInput after the [SearchBox](searchbox.md) receives focus. To do this, register for the [PrepareForFocusOnKeyboardInput](searchbox_prepareforfocusonkeyboardinput.md) event and use the event handler to set FocusOnKeyboardInput to **false**.
     * 1. When the [SearchBox](searchbox.md) loses focus, set FocusOnKeyboardInput back to **true**. To do this, register for the [LostFocus](control_onlostfocus_679101471.md) event and use the event handler to set FocusOnKeyboardInput back to **true**.
     * 
     * 
     * When FocusOnKeyboardInput is **true**, keyboard input on the current thread is intercepted and textual input is redirected to the [SearchBox](searchbox.md). Only textual input will cause the [SearchBox](searchbox.md) to receive focus. Non-text keys, such as arrows or Tab, are not redirected to the [SearchBox](searchbox.md). WIN/CTRL/ALT key combinations (except for Ctrl-V for paste) are also not redirected.
     * 
     * To do more than just set focus in the [SearchBox](searchbox.md), such as make the control visible, handle the [PrepareForFocusOnKeyboardInput](searchbox_prepareforfocusonkeyboardinput.md) event.
     * 
     * You should set FocusOnKeyboardInput to **false** if the user sets focus on some other editable text field.
     * 
     * To learn more about when you should let users type to search, see [Guidelines and checklist for search](/windows/uwp/controls-and-patterns/search).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.focusonkeyboardinput
     * @type {Boolean} 
     */
    FocusOnKeyboardInput {
        get => this.get_FocusOnKeyboardInput()
        set => this.put_FocusOnKeyboardInput(value)
    }

    /**
     * Gets or sets a value that determines whether the suggested search query is activated when the user presses Enter.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.choosesuggestiononenter
     * @type {Boolean} 
     */
    ChooseSuggestionOnEnter {
        get => this.get_ChooseSuggestionOnEnter()
        set => this.put_ChooseSuggestionOnEnter(value)
    }

    /**
     * Occurs when the query text changes.
     * @type {TypedEventHandler<SearchBox, SearchBoxQueryChangedEventArgs>}
    */
    OnQueryChanged {
        get {
            if(!this.HasProp("__OnQueryChanged")){
                this.__OnQueryChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b15ccc28-40f3-52da-9011-87621e9c60ea}"),
                    SearchBox,
                    SearchBoxQueryChangedEventArgs
                )
                this.__OnQueryChangedToken := this.add_QueryChanged(this.__OnQueryChanged.iface)
            }
            return this.__OnQueryChanged
        }
    }

    /**
     * Occurs when the user's query text changes and the app needs to provide new suggestions to display in the search pane.
     * @remarks
     * You can get suggestions from several sources:
     * 
     * 
     * + You can define them yourself. For example, you could create a list of car manufacturers.
     * + You can get them from Windows if your app searches local files.
     * + You can get them from a web service or server.
     * 
     * 
     * For user experience guidelines for displaying suggestions, see [Guidelines and checklist for search](/windows/uwp/controls-and-patterns/search).
     * 
     * You can use [LocalContentSuggestionSettings](../windows.applicationmodel.search/localcontentsuggestionsettings.md) to add suggestions, based on local files from Windows, in only a few lines of code. Alternatively, you can register for the search box control's SuggestionsRequested event and build your own list of suggestions that is made up of suggestions you retrieved from another source (like a locally-defined list or a web service).
     * 
     * For code examples that show how to add search suggestions, download the [SearchBox control sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/SearchBox%20control%20sample). The sample demonstrates how to add search suggestions by using all three possible sources, and how to add suggestions for East Asian languages by using alternate forms of the query text generated by an Input Method Editor (IME). (We recommend using query text alternatives if your app will be used by Japanese or Chinese users.)
     * @type {TypedEventHandler<SearchBox, SearchBoxSuggestionsRequestedEventArgs>}
    */
    OnSuggestionsRequested {
        get {
            if(!this.HasProp("__OnSuggestionsRequested")){
                this.__OnSuggestionsRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{287dd4fe-12fc-5289-ab8a-7c7217024a6b}"),
                    SearchBox,
                    SearchBoxSuggestionsRequestedEventArgs
                )
                this.__OnSuggestionsRequestedToken := this.add_SuggestionsRequested(this.__OnSuggestionsRequested.iface)
            }
            return this.__OnSuggestionsRequested
        }
    }

    /**
     * Occurs when the user submits a search query.
     * @remarks
     * Handle this event so that you can get the [QueryText](searchbox_querytext.md) value from [SearchBoxQuerySubmittedEventArgs](searchboxquerysubmittedeventargs.md), and pass it on as navigation data when you load a search results page to display to the user.
     * 
     * For a complete example of how to handle QuerySubmitted as part of a complete example that also does search suggestions, see [SearchBox control sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/Windows%208.1%20Store%20app%20samples/99866-Windows%208.1%20Store%20app%20samples/SearchBox%20control%20sample).
     * 
     * The handler signature for QuerySubmitted uses [TypedEventHandler](/previous-versions/hh438424(v=vs.85)) and enforces that the *sender* parameter be a [SearchBox](searchbox.md) instance, not just **Object**.
     * @type {TypedEventHandler<SearchBox, SearchBoxQuerySubmittedEventArgs>}
    */
    OnQuerySubmitted {
        get {
            if(!this.HasProp("__OnQuerySubmitted")){
                this.__OnQuerySubmitted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{56d6c824-a5b2-51f4-8af7-7b8ee582c029}"),
                    SearchBox,
                    SearchBoxQuerySubmittedEventArgs
                )
                this.__OnQuerySubmittedToken := this.add_QuerySubmitted(this.__OnQuerySubmitted.iface)
            }
            return this.__OnQuerySubmitted
        }
    }

    /**
     * Occurs when the user picks a suggested search result.
     * @type {TypedEventHandler<SearchBox, SearchBoxResultSuggestionChosenEventArgs>}
    */
    OnResultSuggestionChosen {
        get {
            if(!this.HasProp("__OnResultSuggestionChosen")){
                this.__OnResultSuggestionChosen := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8d18767b-a4b8-52fc-8767-f87d05b5172e}"),
                    SearchBox,
                    SearchBoxResultSuggestionChosenEventArgs
                )
                this.__OnResultSuggestionChosenToken := this.add_ResultSuggestionChosen(this.__OnResultSuggestionChosen.iface)
            }
            return this.__OnResultSuggestionChosen
        }
    }

    /**
     * Occurs when the [FocusOnKeyboardInput](searchbox_focusonkeyboardinput.md) property is **true** and the app receives textual keyboard input.
     * @remarks
     * This event occurs only if the [FocusOnKeyboardInput](searchbox_focusonkeyboardinput.md) property is **true**. If you wan to provide "type-to-search" behavior in your app, you should handle this event and synchronously ensure the [SearchBox](searchbox.md) control is visible before the event call completes. After this event occurs, the control sets focus to itself.
     * 
     * When [FocusOnKeyboardInput](searchbox_focusonkeyboardinput.md) is **true**, keyboard input on the current thread is intercepted and textual input is redirected to the [SearchBox](searchbox.md). Only textual input will cause the [SearchBox](searchbox.md) to receive focus. Non-text keys, such as arrows or Tab, are not redirected to the [SearchBox](searchbox.md). WIN/CTRL/ALT key combinations (except for Ctrl-V for paste) are also not redirected.
     * @type {TypedEventHandler<SearchBox, RoutedEventArgs>}
    */
    OnPrepareForFocusOnKeyboardInput {
        get {
            if(!this.HasProp("__OnPrepareForFocusOnKeyboardInput")){
                this.__OnPrepareForFocusOnKeyboardInput := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{a16eff3c-cc37-554c-8f10-0f7e6e2bcaad}"),
                    SearchBox,
                    RoutedEventArgs
                )
                this.__OnPrepareForFocusOnKeyboardInputToken := this.add_PrepareForFocusOnKeyboardInput(this.__OnPrepareForFocusOnKeyboardInput.iface)
            }
            return this.__OnPrepareForFocusOnKeyboardInput
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
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

        if(this.HasProp("__OnPrepareForFocusOnKeyboardInputToken")) {
            this.remove_PrepareForFocusOnKeyboardInput(this.__OnPrepareForFocusOnKeyboardInputToken)
            this.__OnPrepareForFocusOnKeyboardInput.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SearchHistoryEnabled() {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.get_SearchHistoryEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_SearchHistoryEnabled(value) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.put_SearchHistoryEnabled(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SearchHistoryContext() {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.get_SearchHistoryContext()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_SearchHistoryContext(value) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.put_SearchHistoryContext(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PlaceholderText() {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.get_PlaceholderText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_PlaceholderText(value) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.put_PlaceholderText(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.get_QueryText()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_QueryText(value) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.put_QueryText(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_FocusOnKeyboardInput() {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.get_FocusOnKeyboardInput()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_FocusOnKeyboardInput(value) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.put_FocusOnKeyboardInput(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ChooseSuggestionOnEnter() {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.get_ChooseSuggestionOnEnter()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ChooseSuggestionOnEnter(value) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.put_ChooseSuggestionOnEnter(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxQueryChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QueryChanged(handler) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.add_QueryChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QueryChanged(token) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.remove_QueryChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxSuggestionsRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SuggestionsRequested(handler) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.add_SuggestionsRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SuggestionsRequested(token) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.remove_SuggestionsRequested(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxQuerySubmittedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_QuerySubmitted(handler) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.add_QuerySubmitted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_QuerySubmitted(token) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.remove_QuerySubmitted(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, SearchBoxResultSuggestionChosenEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ResultSuggestionChosen(handler) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.add_ResultSuggestionChosen(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ResultSuggestionChosen(token) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.remove_ResultSuggestionChosen(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SearchBox, RoutedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PrepareForFocusOnKeyboardInput(handler) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.add_PrepareForFocusOnKeyboardInput(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PrepareForFocusOnKeyboardInput(token) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.remove_PrepareForFocusOnKeyboardInput(token)
    }

    /**
     * Specifies whether suggestions based on local files are automatically displayed in the search box suggestions, and defines the criteria that Windows uses to locate and filter these suggestions.
     * @remarks
     * When local content suggestions are enabled, Windows provides search suggestions from the user's local files as the user enters query text. For example, a picture application can configure local content suggestions so that search suggestions come only from a particular kind of image file that is stored in the user's picture library.
     * 
     * To search a local library, the appropriate capability must be declared in the app manifest. For more info, see [App capability declarations](/windows/uwp/packaging/app-capability-declarations).
     * @param {LocalContentSuggestionSettings} settings The new settings for local content suggestions.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.searchbox.setlocalcontentsuggestionsettings
     */
    SetLocalContentSuggestionSettings(settings) {
        if (!this.HasProp("__ISearchBox")) {
            if ((queryResult := this.QueryInterface(ISearchBox.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchBox := ISearchBox(outPtr)
        }

        return this.__ISearchBox.SetLocalContentSuggestionSettings(settings)
    }

;@endregion Instance Methods
}
