#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BasicGeoposition.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class IGeocircle extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGeocircle
     * @type {Guid}
     */
    static IID => Guid("{39e45843-a7f9-4e63-92a7-ba0c28d124b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Center", "get_Radius"]

    /**
     * @type {BasicGeoposition} 
     */
    Center {
        get => this.get_Center()
    }

    /**
     * @type {Float} 
     */
    Radius {
        get => this.get_Radius()
    }

    /**
     * 
     * @returns {BasicGeoposition} 
     */
    get_Center() {
        value := BasicGeoposition()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Radius() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
