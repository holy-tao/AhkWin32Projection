#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAccessKeyDisplayDismissedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [AccessKeyDisplayDismissed](../windows.ui.xaml/uielement_accesskeydisplaydismissed.md) event.
 * @remarks
 * Available starting in Windows 10, version 1607.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.accesskeydisplaydismissedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class AccessKeyDisplayDismissedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAccessKeyDisplayDismissedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAccessKeyDisplayDismissedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [AccessKeyDisplayDismissedEventArgs](accesskeydisplaydismissedeventargs.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Input.AccessKeyDisplayDismissedEventArgs")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

;@endregion Instance Methods
}
