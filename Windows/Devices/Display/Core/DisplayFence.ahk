#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayFence.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a fence object that can be used to synchronize rendering commands between [Direct3D](/windows/desktop/direct3d) devices and a [DisplayDevice](displaydevice.md) object.
 * @remarks
 * A **DisplayFence** can be shared between [Direct3D](/windows/desktop/direct3d) devices and a [DisplayDevice](displaydevice.md) using the **IDisplayDeviceInterop** native COM interface. The **CreateSharedHandle** method can create a shared NT handle for a **DisplayFence** created by a **DisplayDevice**, and the **OpenSharedHandle** method can be used to create a **DisplayFence** object from an existing Direct3D shared fence handle.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displayfence
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayFence extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayFence

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayFence.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
