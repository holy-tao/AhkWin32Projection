#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BasicGeoposition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeoboundingBox extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeoboundingBox
     * @type {Guid}
     */
    static IID => Guid("{0896c80b-274f-43da-9a06-cbfcdaeb4ec2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NorthwestCorner", "get_SoutheastCorner", "get_Center", "get_MinAltitude", "get_MaxAltitude"]

    /**
     * @type {BasicGeoposition} 
     */
    NorthwestCorner {
        get => this.get_NorthwestCorner()
    }

    /**
     * @type {BasicGeoposition} 
     */
    SoutheastCorner {
        get => this.get_SoutheastCorner()
    }

    /**
     * @type {BasicGeoposition} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * @type {Float} 
     */
    MinAltitude {
        get => this.get_MinAltitude()
    }

    /**
     * @type {Float} 
     */
    MaxAltitude {
        get => this.get_MaxAltitude()
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_NorthwestCorner() {
        value := BasicGeoposition()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_SoutheastCorner() {
        value := BasicGeoposition()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_Center() {
        value := BasicGeoposition()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinAltitude() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAltitude() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
