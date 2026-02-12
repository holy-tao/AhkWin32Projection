#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Devices\Geolocation\Geopath.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControl4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControl4
     * @type {Guid}
     */
    static IID => Guid("{068f132a-1817-466d-b7ce-419b3f8e248b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BusinessLandmarksEnabled", "put_BusinessLandmarksEnabled", "get_TransitFeaturesEnabled", "put_TransitFeaturesEnabled", "GetVisibleRegion"]

    /**
     * @type {Boolean} 
     */
    BusinessLandmarksEnabled {
        get => this.get_BusinessLandmarksEnabled()
        set => this.put_BusinessLandmarksEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    TransitFeaturesEnabled {
        get => this.get_TransitFeaturesEnabled()
        set => this.put_TransitFeaturesEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BusinessLandmarksEnabled() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BusinessLandmarksEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TransitFeaturesEnabled() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_TransitFeaturesEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} region_ 
     * @returns {Geopath} 
     */
    GetVisibleRegion(region_) {
        result := ComCall(10, this, "int", region_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(result_)
    }
}
