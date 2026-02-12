#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Devices\Geolocation\GeoboundingBox.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Devices\Geolocation\Geopath.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MapRouteLeg.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRoute extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRoute
     * @type {Guid}
     */
    static IID => Guid("{fb07b732-584d-4583-9c60-641fea274349}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BoundingBox", "get_LengthInMeters", "get_EstimatedDuration", "get_Path", "get_Legs", "get_IsTrafficBased"]

    /**
     * @type {GeoboundingBox} 
     */
    BoundingBox {
        get => this.get_BoundingBox()
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
     * @type {Geopath} 
     */
    Path {
        get => this.get_Path()
    }

    /**
     * @type {IVectorView<MapRouteLeg>} 
     */
    Legs {
        get => this.get_Legs()
    }

    /**
     * @type {Boolean} 
     */
    IsTrafficBased {
        get => this.get_IsTrafficBased()
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
     * @returns {Float} 
     */
    get_LengthInMeters() {
        result := ComCall(7, this, "double*", &value := 0, "int")
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
        result := ComCall(8, this, "ptr", value, "int")
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
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Geopath(value)
    }

    /**
     * 
     * @returns {IVectorView<MapRouteLeg>} 
     */
    get_Legs() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MapRouteLeg, value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTrafficBased() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
