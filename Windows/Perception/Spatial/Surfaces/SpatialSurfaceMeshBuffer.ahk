#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialSurfaceMeshBuffer.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a vertex, index, or normal buffer that holds mesh data for surfaces in the user's surroundings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshbuffer
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class SpatialSurfaceMeshBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialSurfaceMeshBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialSurfaceMeshBuffer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the DXGI format to use when creating a GPU buffer to hold this mesh data or when otherwise interpreting the mesh elements. This enum value can be reinterpreted as a DXGI_FORMAT value.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshbuffer.format
     * @type {Integer} 
     */
    Format {
        get => this.get_Format()
    }

    /**
     * Gets the size, in bytes, between the start of each element in the buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshbuffer.stride
     * @type {Integer} 
     */
    Stride {
        get => this.get_Stride()
    }

    /**
     * Gets the number of elements in the buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshbuffer.elementcount
     * @type {Integer} 
     */
    ElementCount {
        get => this.get_ElementCount()
    }

    /**
     * The memory buffer containing the mesh data.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshbuffer.data
     * @type {IBuffer} 
     */
    Data {
        get => this.get_Data()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Format() {
        if (!this.HasProp("__ISpatialSurfaceMeshBuffer")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshBuffer := ISpatialSurfaceMeshBuffer(outPtr)
        }

        return this.__ISpatialSurfaceMeshBuffer.get_Format()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Stride() {
        if (!this.HasProp("__ISpatialSurfaceMeshBuffer")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshBuffer := ISpatialSurfaceMeshBuffer(outPtr)
        }

        return this.__ISpatialSurfaceMeshBuffer.get_Stride()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ElementCount() {
        if (!this.HasProp("__ISpatialSurfaceMeshBuffer")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshBuffer := ISpatialSurfaceMeshBuffer(outPtr)
        }

        return this.__ISpatialSurfaceMeshBuffer.get_ElementCount()
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    get_Data() {
        if (!this.HasProp("__ISpatialSurfaceMeshBuffer")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshBuffer := ISpatialSurfaceMeshBuffer(outPtr)
        }

        return this.__ISpatialSurfaceMeshBuffer.get_Data()
    }

;@endregion Instance Methods
}
