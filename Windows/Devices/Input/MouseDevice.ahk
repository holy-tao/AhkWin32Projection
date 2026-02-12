#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMouseDevice.ahk
#Include .\IMouseDeviceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MouseDevice.ahk
#Include .\MouseEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Supports the ability to identify and track connected mouse devices.
 * @remarks
 * The [Device Capabilities Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/411c271e537727d737a53fa2cbe99eaecac00cc0/Official%20Windows%20Platform%20Sample/Input%20Device%20capabilities%20sample) demonstrates how to detect the presence of input devices and retrieve the capabilities and attributes of each device.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousedevice
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class MouseDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMouseDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMouseDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the mouse device that is associated with the current view.
     * @returns {MouseDevice} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.input.mousedevice.getforcurrentview
     */
    static GetForCurrentView() {
        if (!MouseDevice.HasProp("__IMouseDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Input.MouseDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMouseDeviceStatics.IID)
            MouseDevice.__IMouseDeviceStatics := IMouseDeviceStatics(factoryPtr)
        }

        return MouseDevice.__IMouseDeviceStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnMouseMovedToken")) {
            this.remove_MouseMoved(this.__OnMouseMovedToken)
            this.__OnMouseMoved.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MouseDevice, MouseEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_MouseMoved(handler) {
        if (!this.HasProp("__IMouseDevice")) {
            if ((queryResult := this.QueryInterface(IMouseDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseDevice := IMouseDevice(outPtr)
        }

        return this.__IMouseDevice.add_MouseMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_MouseMoved(cookie) {
        if (!this.HasProp("__IMouseDevice")) {
            if ((queryResult := this.QueryInterface(IMouseDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseDevice := IMouseDevice(outPtr)
        }

        return this.__IMouseDevice.remove_MouseMoved(cookie)
    }

;@endregion Instance Methods
}
