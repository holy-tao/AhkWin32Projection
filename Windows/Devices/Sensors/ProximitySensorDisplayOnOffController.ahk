#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a controller responsible for turning on or off the phone display based on the readings from the [ProximitySensor](proximitysensor.md).
 * @remarks
 * This class will have no effect if your app is running on a platform that doesn't support a controller for the display state. For example, this class has no effect on applications running on a desktop because the desktop platform does not support a controller cycling the display.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensordisplayonoffcontroller
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ProximitySensorDisplayOnOffController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IClosable

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IClosable.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Disconnects this [ProximitySensorDisplayOnOffController](proximitysensordisplayonoffcontroller.md) instance from the service and frees all the allocated resources.
     * @remarks
     * This method follows the same behavior as [IClosable](/windows/desktop/api/windows.foundation/nn-windows-foundation-iclosable). This means that if you are using Microsoft Visual C++ or C# you should not call this method directly. Instead you should use **delete** or the **Dispose** method respectively. See [IClosable](/windows/desktop/api/windows.foundation/nn-windows-foundation-iclosable) for more details.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.proximitysensordisplayonoffcontroller.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
