#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVector.ahk
#Include .\Geofence.ahk
#Include ..\Geoposition.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GeofenceStateChangeReport.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class IGeofenceMonitor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeofenceMonitor
     * @type {Guid}
     */
    static IID => Guid("{4c0f5f78-1c1f-4621-bbbd-833b92247226}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Geofences", "get_LastKnownGeoposition", "add_GeofenceStateChanged", "remove_GeofenceStateChanged", "ReadReports", "add_StatusChanged", "remove_StatusChanged"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {IVector<Geofence>} 
     */
    Geofences {
        get => this.get_Geofences()
    }

    /**
     * @type {Geoposition} 
     */
    LastKnownGeoposition {
        get => this.get_LastKnownGeoposition()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<Geofence>} 
     */
    get_Geofences() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Geofence, value)
    }

    /**
     * 
     * @returns {Geoposition} 
     */
    get_LastKnownGeoposition() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geoposition(value)
    }

    /**
     * 
     * @param {TypedEventHandler<GeofenceMonitor, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_GeofenceStateChanged(eventHandler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", eventHandler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GeofenceStateChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<GeofenceStateChangeReport>} 
     */
    ReadReports() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GeofenceStateChangeReport, value)
    }

    /**
     * 
     * @param {TypedEventHandler<GeofenceMonitor, IInspectable>} eventHandler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(eventHandler) {
        token := EventRegistrationToken()
        result := ComCall(12, this, "ptr", eventHandler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StatusChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(13, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
