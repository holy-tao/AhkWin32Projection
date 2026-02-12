#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GuidanceManeuver.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GuidanceRoute.ahk
#Include .\GuidanceMapMatchedCoordinate.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GuidanceLaneInfo.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceUpdatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceUpdatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{fdac160b-9e8d-4de3-a9fa-b06321d18db9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Mode", "get_NextManeuver", "get_NextManeuverDistance", "get_AfterNextManeuver", "get_AfterNextManeuverDistance", "get_DistanceToDestination", "get_ElapsedDistance", "get_ElapsedTime", "get_TimeToDestination", "get_RoadName", "get_Route", "get_CurrentLocation", "get_IsNewManeuver", "get_LaneInfo"]

    /**
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
    }

    /**
     * @type {GuidanceManeuver} 
     */
    NextManeuver {
        get => this.get_NextManeuver()
    }

    /**
     * @type {Integer} 
     */
    NextManeuverDistance {
        get => this.get_NextManeuverDistance()
    }

    /**
     * @type {GuidanceManeuver} 
     */
    AfterNextManeuver {
        get => this.get_AfterNextManeuver()
    }

    /**
     * @type {Integer} 
     */
    AfterNextManeuverDistance {
        get => this.get_AfterNextManeuverDistance()
    }

    /**
     * @type {Integer} 
     */
    DistanceToDestination {
        get => this.get_DistanceToDestination()
    }

    /**
     * @type {Integer} 
     */
    ElapsedDistance {
        get => this.get_ElapsedDistance()
    }

    /**
     * @type {TimeSpan} 
     */
    ElapsedTime {
        get => this.get_ElapsedTime()
    }

    /**
     * @type {TimeSpan} 
     */
    TimeToDestination {
        get => this.get_TimeToDestination()
    }

    /**
     * @type {HSTRING} 
     */
    RoadName {
        get => this.get_RoadName()
    }

    /**
     * @type {GuidanceRoute} 
     */
    Route {
        get => this.get_Route()
    }

    /**
     * @type {GuidanceMapMatchedCoordinate} 
     */
    CurrentLocation {
        get => this.get_CurrentLocation()
    }

    /**
     * @type {Boolean} 
     */
    IsNewManeuver {
        get => this.get_IsNewManeuver()
    }

    /**
     * @type {IVectorView<GuidanceLaneInfo>} 
     */
    LaneInfo {
        get => this.get_LaneInfo()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GuidanceManeuver} 
     */
    get_NextManeuver() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceManeuver(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NextManeuverDistance() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GuidanceManeuver} 
     */
    get_AfterNextManeuver() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceManeuver(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AfterNextManeuverDistance() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DistanceToDestination() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElapsedDistance() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_ElapsedTime() {
        value := TimeSpan()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TimeToDestination() {
        value := TimeSpan()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RoadName() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GuidanceRoute} 
     */
    get_Route() {
        result := ComCall(16, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceRoute(result_)
    }

    /**
     * 
     * @returns {GuidanceMapMatchedCoordinate} 
     */
    get_CurrentLocation() {
        result := ComCall(17, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceMapMatchedCoordinate(result_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNewManeuver() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<GuidanceLaneInfo>} 
     */
    get_LaneInfo() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GuidanceLaneInfo, value)
    }
}
