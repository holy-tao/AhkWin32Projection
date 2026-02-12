#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Geolocation\GeoboundingBox.ahk
#Include ..\..\Devices\Geolocation\Geopath.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MapRouteManeuver.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteLeg extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteLeg
     * @type {Guid}
     */
    static IID => Guid("{96f8b2f6-5bba-4d17-9db6-1a263fec7471}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BoundingBox", "get_Path", "get_LengthInMeters", "get_EstimatedDuration", "get_Maneuvers"]

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
     * @type {Float} 
     */
    LengthInMeters {
        get => this.get_LengthInMeters()
    }

    /**
     * @type {TimeSpan} 
     */
    EstimatedDuration {
        get => this.get_EstimatedDuration()
    }

    /**
     * @type {IVectorView<MapRouteManeuver>} 
     */
    Maneuvers {
        get => this.get_Maneuvers()
    }

    /**
     * 
     * @returns {GeoboundingBox} 
     */
    get_BoundingBox() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
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
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LengthInMeters() {
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
    get_EstimatedDuration() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<MapRouteManeuver>} 
     */
    get_Maneuvers() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MapRouteManeuver, value)
    }
}
