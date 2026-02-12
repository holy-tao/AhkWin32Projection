#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPhoneCallActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the launch arguments for the application. The app’s `OnActivated` method will be invoked with the `PhoneCallActivatedEventArgs` class being the `activatedEventArg` payload.
 * @remarks
 * > [!IMPORTANT]
 * > To use this API, your application needs to declare in its `Package.appxmanifest` file `windows.phonecallactivation` as a `uap13:Extension` category. Otherwise, the application won't be able to be activated to facilitate in-app call progress control UI.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.phonecallactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class PhoneCallActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPhoneCallActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPhoneCallActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Identifies the PhoneLine being used. Used to retrieve a corresponding PhoneLine object.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.phonecallactivatedeventargs.lineid
     * @type {Guid} 
     */
    LineId {
        get => this.get_LineId()
    }

    /**
     * Specifies the type of activation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.phonecallactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before this activation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.phonecallactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * The object that provides splash screen information.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.phonecallactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * The user that the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.phonecallactivatedeventargs.user
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
     * @returns {Guid} 
     */
    get_LineId() {
        if (!this.HasProp("__IPhoneCallActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPhoneCallActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPhoneCallActivatedEventArgs := IPhoneCallActivatedEventArgs(outPtr)
        }

        return this.__IPhoneCallActivatedEventArgs.get_LineId()
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
