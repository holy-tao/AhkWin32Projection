#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrintTaskSettingsActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information in response to the event that is raised when print task settings are activated.
  * 
  * > **JavaScript**
  * > This type appears as [WebUIPrintTaskSettingsActivatedEventArgs](../windows.ui.webui/webuiprinttasksettingsactivatedeventargs.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.printtasksettingsactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class PrintTaskSettingsActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrintTaskSettingsActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrintTaskSettingsActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the configuration information for the print task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.printtasksettingsactivatedeventargs.configuration
     * @type {PrintTaskConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
    }

    /**
     * Gets the activation type for the print task settings.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.printtasksettingsactivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before the settings were activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.printtasksettingsactivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.printtasksettingsactivatedeventargs.splashscreen
     * @type {SplashScreen} 
     */
    SplashScreen {
        get => this.get_SplashScreen()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PrintTaskConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IPrintTaskSettingsActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPrintTaskSettingsActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrintTaskSettingsActivatedEventArgs := IPrintTaskSettingsActivatedEventArgs(outPtr)
        }

        return this.__IPrintTaskSettingsActivatedEventArgs.get_Configuration()
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

;@endregion Instance Methods
}
