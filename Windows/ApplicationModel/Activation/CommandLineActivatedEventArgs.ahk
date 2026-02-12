#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICommandLineActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include .\IActivatedEventArgsWithUser.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information, such as the command-line arguments, when an app is activated from the command line.
 * @remarks
 * A UWP app may be activated from **Start|Run** in Windows, from the command line in PowerShell, the DOS command prompt, or from another Win32 process that calls [CreateProcess()](/windows/desktop/api/processthreadsapi/nf-processthreadsapi-createprocessa).
 * 
 * To be activated from the command line, your app must register for the "AppExecutionAlias" extension category in its manifest.
 * 
 * ```xml
 * <uap5:Extension Category="windows.appExecutionAlias" Executable="FruitSalad.exe" EntryPoint="Windows.FruitSalad.Bananas.App">
 *     <uap5:AppExecutionAlias >
 *         <uap5:ExecutionAlias Alias="Fs.exe" />
 *     </uap5:AppExecutionAlias>
 * </uap5:Extension>
 * ```
 * After you register in your manifest, your app can be activated from the command line. When your app is activated, you can use the event information to identify the call activation and extract the parameters that help you complete the call for the user.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class CommandLineActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICommandLineActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICommandLineActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets info about the activation of the app such as what arguments were provided and the current directory path.
     * @remarks
     * The app supplies the exit code which is passed back to the caller.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs.operation
     * @type {CommandLineActivationOperation} 
     */
    Operation {
        get => this.get_Operation()
    }

    /**
     * Gets the type of activation that launched the app.
     * @remarks
     * The expected value is **ActivationKind.CommandLineLaunch**.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets info about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

    /**
     * Gets the user that the app was activated for.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.commandlineactivatedeventargs.user
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
     * @returns {CommandLineActivationOperation} 
     */
    get_Operation() {
        if (!this.HasProp("__ICommandLineActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ICommandLineActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICommandLineActivatedEventArgs := ICommandLineActivatedEventArgs(outPtr)
        }

        return this.__ICommandLineActivatedEventArgs.get_Operation()
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
