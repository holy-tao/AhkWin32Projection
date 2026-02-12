#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccessKeyInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [AccessKeyInvoked](../windows.ui.xaml/uielement_accesskeyinvoked.md) event.
 * @remarks
 * Available starting in Windows 10, version 1607.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeyinvokedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class AccessKeyInvokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccessKeyInvokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccessKeyInvokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for Handled prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeyinvokedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AccessKeyInvokedEventArgs](accesskeyinvokedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyInvokedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IAccessKeyInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccessKeyInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessKeyInvokedEventArgs := IAccessKeyInvokedEventArgs(outPtr)
        }

        return this.__IAccessKeyInvokedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IAccessKeyInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccessKeyInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessKeyInvokedEventArgs := IAccessKeyInvokedEventArgs(outPtr)
        }

        return this.__IAccessKeyInvokedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
