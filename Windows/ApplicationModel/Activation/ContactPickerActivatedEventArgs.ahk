#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContactPickerActivatedEventArgs.ahk
#Include .\IActivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data when an app is activated because it uses the Contact Picker.
  * 
  * 
  * 
  * > **JavaScript**
  * > This type appears as [WebUIContactPickerActivatedEventArgs](../windows.ui.webui/webuicontactpickeractivatedeventargs.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpickeractivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class ContactPickerActivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContactPickerActivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContactPickerActivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the letterbox UI of the contact picker that is displayed when the user wants to pick contacts that are provided by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpickeractivatedeventargs.contactpickerui
     * @type {ContactPickerUI} 
     */
    ContactPickerUI {
        get => this.get_ContactPickerUI()
    }

    /**
     * Gets the activation type.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpickeractivatedeventargs.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the execution state of the app before it was activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpickeractivatedeventargs.previousexecutionstate
     * @type {Integer} 
     */
    PreviousExecutionState {
        get => this.get_PreviousExecutionState()
    }

    /**
     * Gets the splash screen object which provides information about the transition from the splash screen to the activated app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.contactpickeractivatedeventargs.splashscreen
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
     * @returns {ContactPickerUI} 
     */
    get_ContactPickerUI() {
        if (!this.HasProp("__IContactPickerActivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContactPickerActivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContactPickerActivatedEventArgs := IContactPickerActivatedEventArgs(outPtr)
        }

        return this.__IContactPickerActivatedEventArgs.get_ContactPickerUI()
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
