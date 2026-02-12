#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileSavePickerActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IFileSavePickerActivatedEventArgs2.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an activated event that fires when the user saves a file through the file picker and selects the app as the location.
  * 
  * > **JavaScript**
  * > This type appears as [WebUIFileSavePickerActivatedEventArgs](../windows.ui.webui/webuifilesavepickeractivatedeventargs.md).
 * @remarks
 * Learn more about providing your app as a location where the user can save files in the [Windows.Storage.Pickers.Provider](../windows.storage.pickers.provider/windows_storage_pickers_provider.md) namespace reference.
 * 
 * A FileSavePickerActivatedEventArgs object is passed to the app's activation point handler when the user saves a file through the file picker and selects the app as the location. This type of activation is indicated by the [ActivationKind.FileSavePicker](activationkind.md) value returned by the [Kind](filesavepickeractivatedeventargs_kind.md) property.
 * 
 * Apps written in JavaScript must listen for and handle [Windows.UI.WebUI.webUIApplication.activated](../windows.ui.webui/webuiapplication_activated.md) events.
 * 
 * UWP app using C++, C#, or Visual Basic typically implement activation points by overriding methods of the [Application](../windows.ui.xaml/application.md) object. The default template app.xaml code-behind files always include an override for [OnLaunched](../windows.ui.xaml/application_onlaunched_859642554.md), but defining overrides for other activation points such as [OnFileSavePickerActivated](../windows.ui.xaml/application_onfilesavepickeractivated_425940653.md) is up to your app code.
 * 
 * All [Application](../windows.ui.xaml/application.md) overrides involved in an activation scenario should call [Window.Activate](../windows.ui.xaml/window_activate_1797342875.md) in their implementations.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class FileSavePickerActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileSavePickerActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileSavePickerActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the letterbox UI of the file picker that is displayed when the user saves a file and selects the app as the save location.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.filesavepickerui
     * @type {FileSavePickerUI} 
     */
    FileSavePickerUI {
        get => this.get_FileSavePickerUI()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets a [SplashScreen](splashscreen.md) object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * The package family name of the app that launched this app.
     * @remarks
     * *CallerPackageFamilyName* will be empty if the caller is an unpackaged app (such as an unpackaged desktop app).
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Gets the ID of the enterprise that owns the file.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.enterpriseid
     * @type {HSTRING} 
     */
    EnterpriseId {
        get => this.get_EnterpriseId()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickeractivatedeventargs.user
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
     * @returns {FileSavePickerUI} 
     */
    get_FileSavePickerUI() {
        if (!this.HasProp("__IFileSavePickerActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerActivatedEventArgs := IFileSavePickerActivatedEventArgs(outPtr)
        }

        return this.__IFileSavePickerActivatedEventArgs.get_FileSavePickerUI()
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
        if (!this.HasProp("__IFileSavePickerActivatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerActivatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerActivatedEventArgs2 := IFileSavePickerActivatedEventArgs2(outPtr)
        }

        return this.__IFileSavePickerActivatedEventArgs2.get_CallerPackageFamilyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EnterpriseId() {
        if (!this.HasProp("__IFileSavePickerActivatedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerActivatedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerActivatedEventArgs2 := IFileSavePickerActivatedEventArgs2(outPtr)
        }

        return this.__IFileSavePickerActivatedEventArgs2.get_EnterpriseId()
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
