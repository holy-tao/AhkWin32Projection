#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStatusChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [StatusChanged](geolocator_statuschanged.md) event.
 * @remarks
 * The [Geolocator](geolocator.md) object triggers the [StatusChanged](geolocator_statuschanged.md) event to indicate that
 * the user's location settings changed. That event passes the corresponding status via the argument's `Status` property
 * (of type [PositionStatus](positionstatus.md)). Note that this method is not called from the UI thread and the
 * [Dispatcher](../windows.ui.core/coredispatcher.md) object invokes the UI changes. For more info, see
 * [Get current location](/windows/uwp/maps-and-location/get-location).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.statuschangedeventargs
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class StatusChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStatusChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStatusChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The updated status of the [Geolocator](geolocator.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.statuschangedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IStatusChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IStatusChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStatusChangedEventArgs := IStatusChangedEventArgs(outPtr)
        }

        return this.__IStatusChangedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
