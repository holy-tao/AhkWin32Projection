#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\DateTime.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\IGeoshape.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation.Geofencing
 * @version WindowsRuntime 1.4
 */
class IGeofence extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeofence
     * @type {Guid}
     */
    static IID => Guid("{9c090823-edb8-47e0-8245-5bf61d321f2d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartTime", "get_Duration", "get_DwellTime", "get_Id", "get_MonitoredStates", "get_Geoshape", "get_SingleUse"]

    /**
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {TimeSpan} 
     */
    DwellTime {
        get => this.get_DwellTime()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Integer} 
     */
    MonitoredStates {
        get => this.get_MonitoredStates()
    }

    /**
     * @type {IGeoshape} 
     */
    Geoshape {
        get => this.get_Geoshape()
    }

    /**
     * @type {Boolean} 
     */
    SingleUse {
        get => this.get_SingleUse()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DwellTime() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MonitoredStates() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IGeoshape} 
     */
    get_Geoshape() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IGeoshape(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SingleUse() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
