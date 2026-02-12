#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Foundation\Collections\IVector.ahk
#Include .\MapLayer.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Maps
 * @version WindowsRuntime 1.4
 */
class IMapControl6 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapControl6
     * @type {Guid}
     */
    static IID => Guid("{b0da89a2-1041-4bea-b88a-12ac9a82e0e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Layers", "put_Layers", "TryGetLocationFromOffset", "TryGetLocationFromOffsetWithReferenceSystem"]

    /**
     * @type {IVector<MapLayer>} 
     */
    Layers {
        get => this.get_Layers()
        set => this.put_Layers(value)
    }

    /**
     * 
     * @returns {IVector<MapLayer>} 
     */
    get_Layers() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(MapLayer, value)
    }

    /**
     * 
     * @param {IVector<MapLayer>} value 
     * @returns {HRESULT} 
     */
    put_Layers(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {POINT} offset 
     * @param {Pointer<Geopoint>} location_ 
     * @returns {Boolean} 
     */
    TryGetLocationFromOffset(offset, location_) {
        result := ComCall(8, this, "ptr", offset, "ptr", location_, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * 
     * @param {POINT} offset 
     * @param {Integer} desiredReferenceSystem 
     * @param {Pointer<Geopoint>} location_ 
     * @returns {Boolean} 
     */
    TryGetLocationFromOffsetWithReferenceSystem(offset, desiredReferenceSystem, location_) {
        result := ComCall(9, this, "ptr", offset, "int", desiredReferenceSystem, "ptr", location_, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
