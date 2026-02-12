#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeovisitStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains information about a [VisitStateChanged](geovisitmonitor_visitstatechanged.md) event.
 * @remarks
 * This class is instantiated when a [VisitStateChanged](geovisitmonitor_visitstatechanged.md) event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitstatechangedeventargs
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeovisitStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeovisitStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeovisitStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Visit-related event corresponding to a [VisitStateChanged](geovisitmonitor_visitstatechanged.md) event that was raised.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisitstatechangedeventargs.visit
     * @type {Geovisit} 
     */
    Visit {
        get => this.get_Visit()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Geovisit} 
     */
    get_Visit() {
        if (!this.HasProp("__IGeovisitStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IGeovisitStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitStateChangedEventArgs := IGeovisitStateChangedEventArgs(outPtr)
        }

        return this.__IGeovisitStateChangedEventArgs.get_Visit()
    }

;@endregion Instance Methods
}
