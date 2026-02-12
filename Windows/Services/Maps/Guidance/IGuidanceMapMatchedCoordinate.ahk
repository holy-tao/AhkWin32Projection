#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Devices\Geolocation\Geopoint.ahk
#Include .\GuidanceRoadSegment.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class IGuidanceMapMatchedCoordinate extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGuidanceMapMatchedCoordinate
     * @type {Guid}
     */
    static IID => Guid("{b7acb168-2912-4a99-aff1-798609b981fe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Location", "get_CurrentHeading", "get_CurrentSpeed", "get_IsOnStreet", "get_Road"]

    /**
     * @type {Geopoint} 
     */
    Location {
        get => this.get_Location()
    }

    /**
     * @type {Float} 
     */
    CurrentHeading {
        get => this.get_CurrentHeading()
    }

    /**
     * @type {Float} 
     */
    CurrentSpeed {
        get => this.get_CurrentSpeed()
    }

    /**
     * @type {Boolean} 
     */
    IsOnStreet {
        get => this.get_IsOnStreet()
    }

    /**
     * @type {GuidanceRoadSegment} 
     */
    Road {
        get => this.get_Road()
    }

    /**
     * 
     * @returns {Geopoint} 
     */
    get_Location() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopoint(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurrentHeading() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CurrentSpeed() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOnStreet() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {GuidanceRoadSegment} 
     */
    get_Road() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GuidanceRoadSegment(value)
    }
}
