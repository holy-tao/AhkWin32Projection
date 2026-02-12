#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\HolographicCamera.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\HolographicStereoTransform.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCameraPose extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraPose
     * @type {Guid}
     */
    static IID => Guid("{0d7d7e30-12de-45bd-912b-c7f6561599d1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HolographicCamera", "get_Viewport", "TryGetViewTransform", "get_ProjectionTransform", "TryGetCullingFrustum", "TryGetVisibleFrustum", "get_NearPlaneDistance", "get_FarPlaneDistance"]

    /**
     * @type {HolographicCamera} 
     */
    HolographicCamera {
        get => this.get_HolographicCamera()
    }

    /**
     * @type {RECT} 
     */
    Viewport {
        get => this.get_Viewport()
    }

    /**
     * @type {HolographicStereoTransform} 
     */
    ProjectionTransform {
        get => this.get_ProjectionTransform()
    }

    /**
     * @type {Float} 
     */
    NearPlaneDistance {
        get => this.get_NearPlaneDistance()
    }

    /**
     * @type {Float} 
     */
    FarPlaneDistance {
        get => this.get_FarPlaneDistance()
    }

    /**
     * 
     * @returns {HolographicCamera} 
     */
    get_HolographicCamera() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HolographicCamera(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Viewport() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {IReference<HolographicStereoTransform>} 
     */
    TryGetViewTransform(coordinateSystem) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetHolographicStereoTransform(), value)
    }

    /**
     * 
     * @returns {HolographicStereoTransform} 
     */
    get_ProjectionTransform() {
        value := HolographicStereoTransform()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {IReference<SpatialBoundingFrustum>} 
     */
    TryGetCullingFrustum(coordinateSystem) {
        result := ComCall(10, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSpatialBoundingFrustum(), value)
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @returns {IReference<SpatialBoundingFrustum>} 
     */
    TryGetVisibleFrustum(coordinateSystem) {
        result := ComCall(11, this, "ptr", coordinateSystem, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetSpatialBoundingFrustum(), value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NearPlaneDistance() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FarPlaneDistance() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
