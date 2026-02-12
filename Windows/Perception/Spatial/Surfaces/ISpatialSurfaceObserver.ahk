#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\SpatialSurfaceInfo.ahk
#Include ..\..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceObserver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceObserver
     * @type {Guid}
     */
    static IID => Guid("{10b69819-ddca-3483-ac3a-748fe8c86df5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObservedSurfaces", "SetBoundingVolume", "SetBoundingVolumes", "add_ObservedSurfacesChanged", "remove_ObservedSurfacesChanged"]

    /**
     * 
     * @returns {IMapView<Guid, SpatialSurfaceInfo>} 
     */
    GetObservedSurfaces() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetGuid(), SpatialSurfaceInfo, value)
    }

    /**
     * 
     * @param {SpatialBoundingVolume} bounds 
     * @returns {HRESULT} 
     */
    SetBoundingVolume(bounds) {
        result := ComCall(7, this, "ptr", bounds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IIterable<SpatialBoundingVolume>} bounds 
     * @returns {HRESULT} 
     */
    SetBoundingVolumes(bounds) {
        result := ComCall(8, this, "ptr", bounds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialSurfaceObserver, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ObservedSurfacesChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(9, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ObservedSurfacesChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(10, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
