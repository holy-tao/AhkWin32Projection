#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAutomationProviderRequestedEventArgs.ahk
#Include .\ICoreWindowEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the arguments returned by an automation provider request event callback.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.automationproviderrequestedeventargs
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class AutomationProviderRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAutomationProviderRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAutomationProviderRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the automation provider object returned by the request event callback.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.automationproviderrequestedeventargs.automationprovider
     * @type {IInspectable} 
     */
    AutomationProvider {
        get => this.get_AutomationProvider()
        set => this.put_AutomationProvider(value)
    }

    /**
     * Gets or sets whether the automation provider request event has been handled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.automationproviderrequestedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_AutomationProvider() {
        if (!this.HasProp("__IAutomationProviderRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutomationProviderRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationProviderRequestedEventArgs := IAutomationProviderRequestedEventArgs(outPtr)
        }

        return this.__IAutomationProviderRequestedEventArgs.get_AutomationProvider()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_AutomationProvider(value) {
        if (!this.HasProp("__IAutomationProviderRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAutomationProviderRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAutomationProviderRequestedEventArgs := IAutomationProviderRequestedEventArgs(outPtr)
        }

        return this.__IAutomationProviderRequestedEventArgs.put_AutomationProvider(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__ICoreWindowEventArgs")) {
            if ((queryResult := this.QueryInterface(ICoreWindowEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreWindowEventArgs := ICoreWindowEventArgs(outPtr)
        }

        return this.__ICoreWindowEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
