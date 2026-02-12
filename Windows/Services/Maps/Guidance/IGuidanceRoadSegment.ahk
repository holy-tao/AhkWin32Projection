#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Devices\Geolocation\Geopath.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceRoadSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceRoadSegment
     * @type {Guid}
     */
    static IID => Guid("{b32758a6-be78-4c63-afe7-6c2957479b3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RoadName", "get_ShortRoadName", "get_SpeedLimit", "get_TravelTime", "get_Path", "get_Id", "get_IsHighway", "get_IsTunnel", "get_IsTollRoad"]

    /**
     * @type {HSTRING} 
     */
    RoadName {
        get => this.get_RoadName()
    }

    /**
     * @type {HSTRING} 
     */
    ShortRoadName {
        get => this.get_ShortRoadName()
    }

    /**
     * @type {Float} 
     */
    SpeedLimit {
        get => this.get_SpeedLimit()
    }

    /**
     * @type {TimeSpan} 
     */
    TravelTime {
        get => this.get_TravelTime()
    }

    /**
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    IsHighway {
        get => this.get_IsHighway()
    }

    /**
     * @type {Boolean} 
     */
    IsTunnel {
        get => this.get_IsTunnel()
    }

    /**
     * @type {Boolean} 
     */
    IsTollRoad {
        get => this.get_IsTollRoad()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoadName() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ShortRoadName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeedLimit() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TravelTime() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Geopath} 
     */
    get_Path() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHighway() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTunnel() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTollRoad() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
