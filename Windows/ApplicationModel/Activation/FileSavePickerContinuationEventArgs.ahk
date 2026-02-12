#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFileSavePickerContinuationEventArgs.ahk
#Include .\IContinuationActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about an activated event that fires after the app was suspended for a file save picker operation.
 * @remarks
 * > [!NOTE]
 * > This class was deprecated in Windows 10, version 2004 (build 19041). The file/folder continuation APIs are no longer relevant with the discontinuation of Windows Phone.
 * 
 * You access a `FileSavePickerContinuationEventArgs` object when you implement an event handler that responds to [Activated](../windows.applicationmodel.core/coreapplicationview_activated.md) events when [ActivationKind](activationkind.md) is `PickSaveFileContinuation`.
 * 
 * For an example that uses the `FileSavePickerContinuationEventArgs` class, see [How to continue your Windows Phone 8.x app after calling an AndContinue method](/previous-versions/windows/apps/dn631755(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class FileSavePickerContinuationEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFileSavePickerContinuationEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFileSavePickerContinuationEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the file selected by the user during the file save picker operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs.file
     * @type {StorageFile} 
     */
    File {
        get => this.get_File()
    }

    /**
     * Gets a set of values populated by the app before a [FileSavePicker](../windows.storage.pickers/filesavepicker.md) operation that deactivates the app in order to provide context when the app is activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs.continuationdata
     * @type {ValueSet} 
     */
    ContinuationData {
        get => this.get_ContinuationData()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets a [SplashScreen](splashscreen.md) object that provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user that the app was activated for.
     * @remarks
     * This property returns the logged-in user on platforms that only support single-user sessions. For platforms that support multiple users in a session, this property returns the logged-in user that the app was activated for.
     * 
     * This property returns **null** when a multi-user application is activated with no specific user context.
     * 
     * Multi-user apps can use this property to allow or restrict app behavior. For example, you might restrict access to content or features based on the user’s credentials.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.filesavepickercontinuationeventargs.user
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
     * @returns {StorageFile} 
     */
    get_File() {
        if (!this.HasProp("__IFileSavePickerContinuationEventArgs")) {
            if ((queryResult := this.QueryInterface(IFileSavePickerContinuationEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFileSavePickerContinuationEventArgs := IFileSavePickerContinuationEventArgs(outPtr)
        }

        return this.__IFileSavePickerContinuationEventArgs.get_File()
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_ContinuationData() {
        if (!this.HasProp("__IContinuationActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContinuationActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContinuationActivatedEventArgs := IContinuationActivatedEventArgs(outPtr)
        }

        return this.__IContinuationActivatedEventArgs.get_ContinuationData()
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
