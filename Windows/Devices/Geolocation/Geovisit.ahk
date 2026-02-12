#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeovisit.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a Visit-related state change. See [Guidelines for using Visits tracking](/windows/uwp/maps-and-location/guidelines-for-visits) for information on how to use this feature.
 * @remarks
 * This class is instantiated whenever a Visit-related state change has been obtained by the app.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisit
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class Geovisit extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeovisit

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeovisit.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location where this Visit-related state change took place.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisit.position
     * @type {Geoposition} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * Gets the type of state change that this [Geovisit](geovisit.md) instance represents.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisit.statechange
     * @type {Integer} 
     */
    StateChange {
        get => this.get_StateChange()
    }

    /**
     * Gets the time that this Visit-related state change happened.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisit.timestamp
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
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
        if (!this.HasProp("__IGeovisit")) {
            if ((queryResult := this.QueryInterface(IGeovisit.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisit := IGeovisit(outPtr)
        }

        return this.__IGeovisit.get_Position()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StateChange() {
        if (!this.HasProp("__IGeovisit")) {
            if ((queryResult := this.QueryInterface(IGeovisit.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisit := IGeovisit(outPtr)
        }

        return this.__IGeovisit.get_StateChange()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IGeovisit")) {
            if ((queryResult := this.QueryInterface(IGeovisit.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisit := IGeovisit(outPtr)
        }

        return this.__IGeovisit.get_Timestamp()
    }

;@endregion Instance Methods
}
