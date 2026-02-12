#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISearchActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IApplicationViewActivatedEventArgs.ahk
#Include .\ISearchActivatedEventArgsWithLinguisticDetails.ahk
#Include .\IViewSwitcherProvider.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about the activated event that fires when the user searches the app from the Search charm and the app isn't the main app on screen.
  * 
  * > **JavaScript**
  * > This type appears as [webUISearchActivatedEventArgs](../windows.ui.webui/webuisearchactivatedeventargs.md).
 * @remarks
 * > [!IMPORTANT]
 * > To implement search in an app for Windows 10 or later, use [AutoSuggestBox](/uwp/api/windows.ui.xaml.controls.autosuggestbox). See [Auto-suggest box](/windows/apps/design/controls/auto-suggest-box) for more info.
 * >
 * > You should not use [Windows.ApplicationModel.Search](/uwp/api/windows.applicationmodel.search) APIs ([SearchPane](/uwp/api/windows.applicationmodel.search.searchpane), `SearchContract`) or [SearchBox](../windows.ui.xaml.controls/searchbox.md) APIs in apps for Windows 10 or later.
 * 
 * If your app integrates with the Search contract, a SearchActivatedEventArgs object is passed to your app's [OnSearchActivated](../windows.ui.xaml/application_onsearchactivated_1291367716.md) activation point handler when the user searches the app from the Search charm and your app is not the main app on screen. This type of activation is indicated by the [ActivationKind.Search](activationkind.md) value returned by the [Kind](searchactivatedeventargs_kind.md) property.
 * 
 * All [Application](../windows.ui.xaml/application.md) overrides involved in an activation scenario should call [Window.Activate](../windows.ui.xaml/window_activate_1797342875.md) in their implementations.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class SearchActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISearchActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISearchActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the text that the user wants the app to search for. The user entered this text into the search box of the search pane.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.querytext
     * @type {HSTRING} 
     */
    QueryText {
        get => this.get_QueryText()
    }

    /**
     * Gets the Internet Engineering Task Force (IETF) language tag (BCP 47 standard) that identifies the language currently associated with the user's text input device.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets a [SplashScreen](splashscreen.md) object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the identifier for the currently shown app view.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.currentlyshownapplicationviewid
     * @type {Integer} 
     */
    CurrentlyShownApplicationViewId {
        get => this.get_CurrentlyShownApplicationViewId()
    }

    /**
     * Gets a [SearchPaneQueryLinguisticDetails](../windows.applicationmodel.search/searchpanequerylinguisticdetails.md) object that provides info about query text that the user enters through an Input Method Editor (IME).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.linguisticdetails
     * @type {SearchPaneQueryLinguisticDetails} 
     */
    LinguisticDetails {
        get => this.get_LinguisticDetails()
    }

    /**
     * Gets the view switcher object that allows you to set the view for the application.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.viewswitcher
     * @type {ActivationViewSwitcher} 
     */
    ViewSwitcher {
        get => this.get_ViewSwitcher()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.searchactivatedeventargs.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_QueryText() {
        if (!this.HasProp("__ISearchActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchActivatedEventArgs := ISearchActivatedEventArgs(outPtr)
        }

        return this.__ISearchActivatedEventArgs.get_QueryText()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__ISearchActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISearchActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchActivatedEventArgs := ISearchActivatedEventArgs(outPtr)
        }

        return this.__ISearchActivatedEventArgs.get_Language()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreviousExecutionState() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_PreviousExecutionState()
    }

    /**
     * 
     * @returns {SplashScreen} 
     */
    get_SplashScreen() {
        if (!this.HasProp("__IActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgs := IActivatedEventArgs(outPtr)
        }

        return this.__IActivatedEventArgs.get_SplashScreen()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentlyShownApplicationViewId() {
        if (!this.HasProp("__IApplicationViewActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IApplicationViewActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IApplicationViewActivatedEventArgs := IApplicationViewActivatedEventArgs(outPtr)
        }

        return this.__IApplicationViewActivatedEventArgs.get_CurrentlyShownApplicationViewId()
    }

    /**
     * 
     * @returns {SearchPaneQueryLinguisticDetails} 
     */
    get_LinguisticDetails() {
        if (!this.HasProp("__ISearchActivatedEventArgsWithLinguisticDetails")) {
            if ((queryResult := this.QueryInterface(ISearchActivatedEventArgsWithLinguisticDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISearchActivatedEventArgsWithLinguisticDetails := ISearchActivatedEventArgsWithLinguisticDetails(outPtr)
        }

        return this.__ISearchActivatedEventArgsWithLinguisticDetails.get_LinguisticDetails()
    }

    /**
     * 
     * @returns {ActivationViewSwitcher} 
     */
    get_ViewSwitcher() {
        if (!this.HasProp("__IViewSwitcherProvider")) {
            if ((queryResult := this.QueryInterface(IViewSwitcherProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewSwitcherProvider := IViewSwitcherProvider(outPtr)
        }

        return this.__IViewSwitcherProvider.get_ViewSwitcher()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IActivatedEventArgsWithUser")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsWithUser.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsWithUser := IActivatedEventArgsWithUser(outPtr)
        }

        return this.__IActivatedEventArgsWithUser.get_User()
    }

;@endregion Instance Methods
}
