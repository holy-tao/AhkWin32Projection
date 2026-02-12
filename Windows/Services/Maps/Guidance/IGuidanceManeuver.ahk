#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Devices\Geolocation\Geopoint.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\GuidanceRoadSignpost.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceManeuver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceManeuver
     * @type {Guid}
     */
    static IID => Guid("{fc09326c-ecc9-4928-a2a1-7232b99b94a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartLocation", "get_DistanceFromRouteStart", "get_DistanceFromPreviousManeuver", "get_DepartureRoadName", "get_NextRoadName", "get_DepartureShortRoadName", "get_NextShortRoadName", "get_Kind", "get_StartAngle", "get_EndAngle", "get_RoadSignpost", "get_InstructionText"]

    /**
     * @type {Geopoint} 
     */
    StartLocation {
        get => this.get_StartLocation()
    }

    /**
     * @type {Integer} 
     */
    DistanceFromRouteStart {
        get => this.get_DistanceFromRouteStart()
    }

    /**
     * @type {Integer} 
     */
    DistanceFromPreviousManeuver {
        get => this.get_DistanceFromPreviousManeuver()
    }

    /**
     * @type {HSTRING} 
     */
    DepartureRoadName {
        get => this.get_DepartureRoadName()
    }

    /**
     * @type {HSTRING} 
     */
    NextRoadName {
        get => this.get_NextRoadName()
    }

    /**
     * @type {HSTRING} 
     */
    DepartureShortRoadName {
        get => this.get_DepartureShortRoadName()
    }

    /**
     * @type {HSTRING} 
     */
    NextShortRoadName {
        get => this.get_NextShortRoadName()
    }

    /**
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * @type {Integer} 
     */
    StartAngle {
        get => this.get_StartAngle()
    }

    /**
     * @type {Integer} 
     */
    EndAngle {
        get => this.get_EndAngle()
    }

    /**
     * @type {GuidanceRoadSignpost} 
     */
    RoadSignpost {
        get => this.get_RoadSignpost()
    }

    /**
     * @type {HSTRING} 
     */
    InstructionText {
        get => this.get_InstructionText()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_StartLocation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DistanceFromRouteStart() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DistanceFromPreviousManeuver() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DepartureRoadName() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NextRoadName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DepartureShortRoadName() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NextShortRoadName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StartAngle() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EndAngle() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GuidanceRoadSignpost} 
     */
    get_RoadSignpost() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceRoadSignpost(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_InstructionText() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
