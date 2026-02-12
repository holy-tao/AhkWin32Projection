#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGeovisitTrigger.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an event that triggers a Visits-related background task.
 * @remarks
 * For more information, see the [Guidelines for using Visits tracking](/windows/uwp/maps-and-location/guidelines-for-visits).
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.geovisittrigger
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class GeovisitTrigger extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGeovisitTrigger

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGeovisitTrigger.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets and sets the scope of Visits to monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.geovisittrigger.monitoringscope
     * @type {Integer} 
     */
    MonitoringScope {
        get => this.get_MonitoringScope()
        set => this.put_MonitoringScope(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new [GeovisitTrigger](GeovisitTrigger.md) instance.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.GeovisitTrigger")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitoringScope() {
        if (!this.HasProp("__IGeovisitTrigger")) {
            if ((queryResult := this.QueryInterface(IGeovisitTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitTrigger := IGeovisitTrigger(outPtr)
        }

        return this.__IGeovisitTrigger.get_MonitoringScope()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MonitoringScope(value) {
        if (!this.HasProp("__IGeovisitTrigger")) {
            if ((queryResult := this.QueryInterface(IGeovisitTrigger.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGeovisitTrigger := IGeovisitTrigger(outPtr)
        }

        return this.__IGeovisitTrigger.put_MonitoringScope(value)
    }

;@endregion Instance Methods
}
