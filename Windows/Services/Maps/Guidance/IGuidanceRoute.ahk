#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\GuidanceManeuver.ahk
#Include ..\..\..\Devices\Geolocation\GeoboundingBox.ahk
#Include ..\..\..\Devices\Geolocation\Geopath.ahk
#Include .\GuidanceRoadSegment.ahk
#Include ..\MapRoute.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceRoute extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceRoute
     * @type {Guid}
     */
    static IID => Guid("{3a14545d-801a-40bd-a286-afb2010cce6c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Duration", "get_Distance", "get_Maneuvers", "get_BoundingBox", "get_Path", "get_RoadSegments", "ConvertToMapRoute"]

    /**
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * @type {Integer} 
     */
    Distance {
        get => this.get_Distance()
    }

    /**
     * @type {IVectorView<GuidanceManeuver>} 
     */
    Maneuvers {
        get => this.get_Maneuvers()
    }

    /**
     * @type {GeoboundingBox} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
    }

    /**
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IVectorView<GuidanceRoadSegment>} 
     */
    RoadSegments {
        get => this.get_RoadSegments()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        value := TimeSpan()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Distance() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<GuidanceManeuver>} 
     */
    get_Maneuvers() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GuidanceManeuver, value)
    }

    /**
     * 
     * @returns {GeoboundingBox} 
     */
    get_BoundingBox() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GeoboundingBox(value)
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
     * @returns {IVectorView<GuidanceRoadSegment>} 
     */
    get_RoadSegments() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(GuidanceRoadSegment, value)
    }

    /**
     * 
     * @returns {MapRoute} 
     */
    ConvertToMapRoute() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MapRoute(result_)
    }
}
