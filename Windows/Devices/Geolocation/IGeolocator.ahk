#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\Geoposition.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeolocator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeolocator
     * @type {Guid}
     */
    static IID => Guid("{a9c3bf62-4524-4989-8aa9-de019d2e551f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DesiredAccuracy", "put_DesiredAccuracy", "get_MovementThreshold", "put_MovementThreshold", "get_ReportInterval", "put_ReportInterval", "get_LocationStatus", "GetGeopositionAsync", "GetGeopositionAsyncWithAgeAndTimeout", "add_PositionChanged", "remove_PositionChanged", "add_StatusChanged", "remove_StatusChanged"]

    /**
     * @type {Integer} 
     */
    DesiredAccuracy {
        get => this.get_DesiredAccuracy()
        set => this.put_DesiredAccuracy(value)
    }

    /**
     * @type {Float} 
     */
    MovementThreshold {
        get => this.get_MovementThreshold()
        set => this.put_MovementThreshold(value)
    }

    /**
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
        set => this.put_ReportInterval(value)
    }

    /**
     * @type {Integer} 
     */
    LocationStatus {
        get => this.get_LocationStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DesiredAccuracy() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_DesiredAccuracy(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MovementThreshold() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MovementThreshold(value) {
        result := ComCall(9, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReportInterval(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LocationStatus() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IAsyncOperation<Geoposition>} 
     */
    GetGeopositionAsync() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Geoposition, value)
    }

    /**
     * 
     * @param {TimeSpan} maximumAge 
     * @param {TimeSpan} timeout 
     * @returns {IAsyncOperation<Geoposition>} 
     */
    GetGeopositionAsyncWithAgeAndTimeout(maximumAge, timeout) {
        result := ComCall(14, this, "ptr", maximumAge, "ptr", timeout, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(Geoposition, value)
    }

    /**
     * 
     * @param {TypedEventHandler<Geolocator, PositionChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PositionChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(15, this, "ptr", handler, "ptr", token, "int")
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
    remove_PositionChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(16, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<Geolocator, StatusChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StatusChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(17, this, "ptr", handler, "ptr", token, "int")
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

        result := ComCall(18, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
