#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccessKeyDisplayRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [AccessKeyDisplayRequested](../windows.ui.xaml/uielement_accesskeydisplayrequested.md) event.
 * @remarks
 * Available starting in Windows 10, version 1607.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeydisplayrequestedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class AccessKeyDisplayRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccessKeyDisplayRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccessKeyDisplayRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the keys that were pressed to start the access key sequence.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeydisplayrequestedeventargs.pressedkeys
     * @type {HSTRING} 
     */
    PressedKeys {
        get => this.get_PressedKeys()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AccessKeyDisplayRequestedEventArgs](accesskeydisplayrequestedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyDisplayRequestedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PressedKeys() {
        if (!this.HasProp("__IAccessKeyDisplayRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAccessKeyDisplayRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAccessKeyDisplayRequestedEventArgs := IAccessKeyDisplayRequestedEventArgs(outPtr)
        }

        return this.__IAccessKeyDisplayRequestedEventArgs.get_PressedKeys()
    }

;@endregion Instance Methods
}
