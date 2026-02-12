#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeovisitTriggerDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the details of a trigger for a Visits-related background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisittriggerdetails
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class GeovisitTriggerDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeovisitTriggerDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeovisitTriggerDetails.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets a list of Visit-related state changes that the user has logged since they were last queried.
     * @remarks
     * This method returns a collection of visit reports that have accumulated since the last time they were read. Each report represents a visit state change event.
     * @returns {IVectorView<Geovisit>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.geovisittriggerdetails.readreports
     */
    ReadReports() {
        if (!this.HasProp("__IGeovisitTriggerDetails")) {
            if ((queryResult := this.QueryInterface(IGeovisitTriggerDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitTriggerDetails := IGeovisitTriggerDetails(outPtr)
        }

        return this.__IGeovisitTriggerDetails.ReadReports()
    }

;@endregion Instance Methods
}
