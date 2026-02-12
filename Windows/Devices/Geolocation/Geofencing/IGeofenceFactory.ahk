#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Geofence.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class IGeofenceFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeofenceFactory
     * @type {Guid}
     */
    static IID => Guid("{841f624b-325f-4b90-bca7-2b8022a93796}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create", "CreateWithMonitorStates", "CreateWithMonitorStatesAndDwellTime", "CreateWithMonitorStatesDwellTimeStartTimeAndDuration"]

    /**
     * Create Extended Stored Procedures
     * @param {HSTRING} id 
     * @param {IGeoshape} geoshape 
     * @returns {Geofence} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(id, geoshape) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(6, this, "ptr", id, "ptr", geoshape, "ptr*", &geofence_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geofence(geofence_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @param {IGeoshape} geoshape 
     * @param {Integer} monitoredStates 
     * @param {Boolean} singleUse 
     * @returns {Geofence} 
     */
    CreateWithMonitorStates(id, geoshape, monitoredStates, singleUse) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(7, this, "ptr", id, "ptr", geoshape, "uint", monitoredStates, "int", singleUse, "ptr*", &geofence_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geofence(geofence_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @param {IGeoshape} geoshape 
     * @param {Integer} monitoredStates 
     * @param {Boolean} singleUse 
     * @param {TimeSpan} dwellTime 
     * @returns {Geofence} 
     */
    CreateWithMonitorStatesAndDwellTime(id, geoshape, monitoredStates, singleUse, dwellTime) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(8, this, "ptr", id, "ptr", geoshape, "uint", monitoredStates, "int", singleUse, "ptr", dwellTime, "ptr*", &geofence_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geofence(geofence_)
    }

    /**
     * 
     * @param {HSTRING} id 
     * @param {IGeoshape} geoshape 
     * @param {Integer} monitoredStates 
     * @param {Boolean} singleUse 
     * @param {TimeSpan} dwellTime 
     * @param {DateTime} startTime 
     * @param {TimeSpan} duration_ 
     * @returns {Geofence} 
     */
    CreateWithMonitorStatesDwellTimeStartTimeAndDuration(id, geoshape, monitoredStates, singleUse, dwellTime, startTime, duration_) {
        if(id is String) {
            pin := HSTRING.Create(id)
            id := pin.Value
        }
        id := id is Win32Handle ? NumGet(id, "ptr") : id

        result := ComCall(9, this, "ptr", id, "ptr", geoshape, "uint", monitoredStates, "int", singleUse, "ptr", dwellTime, "ptr", startTime, "ptr", duration_, "ptr*", &geofence_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geofence(geofence_)
    }
}
