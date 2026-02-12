#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileOpenPickerActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IFileOpenPickerActivatedEventArgs2.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an activated event that fires when the user tries to pick files or folders that are provided by the app.
  * 
  * > **JavaScript**
  * > This type appears as [WebUIFileOpenPickerActivatedEventArgs](../windows.ui.webui/webuifileopenpickeractivatedeventargs.md).
 * @remarks
 * Learn how to provide files for the user to pick from your app in [Quickstart: Providing file services through ](/previous-versions/windows/apps/hh465192(v=win.10)) and in the [Windows.Storage.Pickers.Provider](../windows.storage.pickers.provider/windows_storage_pickers_provider.md) namespace reference.
 * 
 * A FileOpenPickerActivatedEventArgs object is passed to the app's activated event handler when the user wants to pick files or folders that are provided by the app. This type of activation is indicated by the [ActivationKind.FileOpenPicker](activationkind.md) value that is returned by the [Kind](fileopenpickeractivatedeventargs_kind.md) property.
 * 
 * Apps written in JavaScript must listen for and handle [Windows.UI.WebUI.webUIApplication.activated](../windows.ui.webui/webuiapplication_activated.md) events.
 * 
 * UWP app using C++, C#, or Visual Basic typically implement activation points by overriding methods of the [Application](../windows.ui.xaml/application.md) object. The default template app.xaml code-behind files always include an override for [OnLaunched](../windows.ui.xaml/application_onlaunched_859642554.md), but defining overrides for other activation points such as [OnFileOpenPickerActivated](../windows.ui.xaml/application_onfileopenpickeractivated_101387531.md) is up to your app code.
 * 
 * All [Application](../windows.ui.xaml/application.md) overrides involved in an activation scenario should call [Window.Activate](../windows.ui.xaml/window_activate_1797342875.md) in their implementations.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class FileOpenPickerActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileOpenPickerActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileOpenPickerActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the letterbox UI of the file picker that is displayed when the user wants to pick files or folders that are provided by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs.fileopenpickerui
     * @type {FileOpenPickerUI} 
     */
    FileOpenPickerUI {
        get => this.get_FileOpenPickerUI()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets a [SplashScreen](splashscreen.md) object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * The package family name of the app that launched your app.
     * @remarks
     * If the caller is an unpackaged app (such as an unpackaged desktop app), *CallerPackageFamilyName* will be empty, that is `""`.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.fileopenpickeractivatedeventargs.user
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
     * @returns {FileOpenPickerUI} 
     */
    get_FileOpenPickerUI() {
        if (!this.HasProp("__IFileOpenPickerActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerActivatedEventArgs := IFileOpenPickerActivatedEventArgs(outPtr)
        }

        return this.__IFileOpenPickerActivatedEventArgs.get_FileOpenPickerUI()
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
     * @returns {HSTRING} 
     */
    get_CallerPackageFamilyName() {
        if (!this.HasProp("__IFileOpenPickerActivatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IFileOpenPickerActivatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileOpenPickerActivatedEventArgs2 := IFileOpenPickerActivatedEventArgs2(outPtr)
        }

        return this.__IFileOpenPickerActivatedEventArgs2.get_CallerPackageFamilyName()
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
