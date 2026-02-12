#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceMeshOptionsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceMeshOptionsStatics
     * @type {Guid}
     */
    static IID => Guid("{9b340abf-9781-4505-8935-013575caae5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SupportedVertexPositionFormats", "get_SupportedTriangleIndexFormats", "get_SupportedVertexNormalFormats"]

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedVertexPositionFormats {
        get => this.get_SupportedVertexPositionFormats()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedTriangleIndexFormats {
        get => this.get_SupportedTriangleIndexFormats()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedVertexNormalFormats {
        get => this.get_SupportedVertexNormalFormats()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedVertexPositionFormats() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedTriangleIndexFormats() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedVertexNormalFormats() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }
}
