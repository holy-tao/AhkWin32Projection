#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPositionChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [PositionChanged](geolocator_positionchanged.md) event.
 * @remarks
 * This object is the argument passed to the event handler for a [PositionChanged](geolocator_positionchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.positionchangedeventargs
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class PositionChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPositionChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPositionChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The location data associated with the [PositionChanged](geolocator_positionchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.positionchangedeventargs.position
     * @type {Geoposition} 
     */
    Position {
        get => this.get_Position()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geoposition} 
     */
    get_Position() {
        if (!this.HasProp("__IPositionChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPositionChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPositionChangedEventArgs := IPositionChangedEventArgs(outPtr)
        }

        return this.__IPositionChangedEventArgs.get_Position()
    }

;@endregion Instance Methods
}
