#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\Activation\IFileOpenPickerActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgs.ahk
#Include ..\..\ApplicationModel\Activation\IFileOpenPickerActivatedEventArgs2.ahk
#Include .\IActivatedEventArgsDeferral.ahk
#Include ..\..\ApplicationModel\Activation\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an activated event that fires when the user tries to pick files or folders that are provided by the app.
  * 
  * > **C#/C++/VB**
  * > This type appears as [FileOpenPickerActivatedEventArgs](../windows.applicationmodel.activation/fileopenpickeractivatedeventargs.md).
 * @remarks
 * Learn how to offer files for the user to pick from your app in [Quickstart: Providing file services through ](/previous-versions/windows/apps/hh465192(v=win.10)) and in the [Windows.Storage.Pickers.Provider](../windows.storage.pickers.provider/windows_storage_pickers_provider.md) namespace reference.
 * 
 * This object is accessed when you implement an event handler for the [WinJS.Application.Onactivated](/previous-versions/windows/apps/br212679(v=win.10)) or the [Windows.UI.WebUI.WebUIApplication.activated](webuiapplication_activated.md) events when [ActivationKind](../windows.applicationmodel.activation/activationkind.md) is **fileOpenPicker**.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUIFileOpenPickerActivatedEventArgs extends IInspectable {
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.fileopenpickerui
     * @type {FileOpenPickerUI} 
     */
    FileOpenPickerUI {
        get => this.get_FileOpenPickerUI()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the family name of the caller's package.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.callerpackagefamilyname
     * @type {HSTRING} 
     */
    CallerPackageFamilyName {
        get => this.get_CallerPackageFamilyName()
    }

    /**
     * Gets the app activated operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.activatedoperation
     * @type {ActivatedOperation} 
     */
    ActivatedOperation {
        get => this.get_ActivatedOperation()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuifileopenpickeractivatedeventargs.user
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
     * @returns {ActivatedOperation} 
     */
    get_ActivatedOperation() {
        if (!this.HasProp("__IActivatedEventArgsDeferral")) {
            if ((queryResult := this.QueryInterface(IActivatedEventArgsDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedEventArgsDeferral := IActivatedEventArgsDeferral(outPtr)
        }

        return this.__IActivatedEventArgsDeferral.get_ActivatedOperation()
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
