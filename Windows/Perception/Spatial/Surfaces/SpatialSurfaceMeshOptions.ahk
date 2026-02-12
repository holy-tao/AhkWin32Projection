#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialSurfaceMeshOptions.ahk
#Include .\ISpatialSurfaceMeshOptionsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides options to customize the [SpatialSurfaceMesh](spatialsurfacemesh.md) objects you get back from [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class SpatialSurfaceMeshOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialSurfaceMeshOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialSurfaceMeshOptions.IID

    /**
     * Gets a list of the vertex position formats that the system can generate a vertex buffer in.
     * @remarks
     * Supply a value from this list to the [VertexPositionFormat](spatialsurfacemeshoptions_vertexpositionformat.md) property when calling [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md) to request vertex buffers in that format.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.supportedvertexpositionformats
     * @type {IVectorView<Integer>} 
     */
    static SupportedVertexPositionFormats {
        get => SpatialSurfaceMeshOptions.get_SupportedVertexPositionFormats()
    }

    /**
     * Gets a list of the triangle index formats that the system can generate an index buffer in.
     * @remarks
     * Supply a value from this list to the [TriangleIndexFormat](spatialsurfacemeshoptions_triangleindexformat.md) property when calling [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md) to request index buffers in that format.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.supportedtriangleindexformats
     * @type {IVectorView<Integer>} 
     */
    static SupportedTriangleIndexFormats {
        get => SpatialSurfaceMeshOptions.get_SupportedTriangleIndexFormats()
    }

    /**
     * Gets a list of the vertex normal formats that the system can generate a normal buffer in.
     * @remarks
     * Supply a value from this list to the [VertexNormalFormat](spatialsurfacemeshoptions_vertexnormalformat.md) property when calling [SpatialSurfaceInfo.TryComputeLatestMeshAsync](spatialsurfaceinfo_trycomputelatestmeshasync_1431485667.md) to request normal buffers in that format.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.supportedvertexnormalformats
     * @type {IVectorView<Integer>} 
     */
    static SupportedVertexNormalFormats {
        get => SpatialSurfaceMeshOptions.get_SupportedVertexNormalFormats()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_SupportedVertexPositionFormats() {
        if (!SpatialSurfaceMeshOptions.HasProp("__ISpatialSurfaceMeshOptionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialSurfaceMeshOptionsStatics.IID)
            SpatialSurfaceMeshOptions.__ISpatialSurfaceMeshOptionsStatics := ISpatialSurfaceMeshOptionsStatics(factoryPtr)
        }

        return SpatialSurfaceMeshOptions.__ISpatialSurfaceMeshOptionsStatics.get_SupportedVertexPositionFormats()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_SupportedTriangleIndexFormats() {
        if (!SpatialSurfaceMeshOptions.HasProp("__ISpatialSurfaceMeshOptionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialSurfaceMeshOptionsStatics.IID)
            SpatialSurfaceMeshOptions.__ISpatialSurfaceMeshOptionsStatics := ISpatialSurfaceMeshOptionsStatics(factoryPtr)
        }

        return SpatialSurfaceMeshOptions.__ISpatialSurfaceMeshOptionsStatics.get_SupportedTriangleIndexFormats()
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    static get_SupportedVertexNormalFormats() {
        if (!SpatialSurfaceMeshOptions.HasProp("__ISpatialSurfaceMeshOptionsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialSurfaceMeshOptionsStatics.IID)
            SpatialSurfaceMeshOptions.__ISpatialSurfaceMeshOptionsStatics := ISpatialSurfaceMeshOptionsStatics(factoryPtr)
        }

        return SpatialSurfaceMeshOptions.__ISpatialSurfaceMeshOptionsStatics.get_SupportedVertexNormalFormats()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the element format for generated vertex buffers.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.vertexpositionformat
     * @type {Integer} 
     */
    VertexPositionFormat {
        get => this.get_VertexPositionFormat()
        set => this.put_VertexPositionFormat(value)
    }

    /**
     * Gets or sets the element format for generated index buffers.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.triangleindexformat
     * @type {Integer} 
     */
    TriangleIndexFormat {
        get => this.get_TriangleIndexFormat()
        set => this.put_TriangleIndexFormat(value)
    }

    /**
     * Gets or sets the element format for generated normal buffers.
     * @remarks
     * Note that normal buffers will only be generated if you set [IncludeVertexNormals](spatialsurfacemeshoptions_includevertexnormals.md) to true.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.vertexnormalformat
     * @type {Integer} 
     */
    VertexNormalFormat {
        get => this.get_VertexNormalFormat()
        set => this.put_VertexNormalFormat(value)
    }

    /**
     * Gets or sets whether to compute a normal buffer.
     * @remarks
     * [SpatialSurfaceMesh.VertexNormals](spatialsurfacemesh_vertexnormals.md) will only be non-null if IncludeVertexNormals is set to true.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.spatial.surfaces.spatialsurfacemeshoptions.includevertexnormals
     * @type {Boolean} 
     */
    IncludeVertexNormals {
        get => this.get_IncludeVertexNormals()
        set => this.put_IncludeVertexNormals(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SpatialSurfaceMeshOptions](spatialsurfacemeshoptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Perception.Spatial.Surfaces.SpatialSurfaceMeshOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexPositionFormat() {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.get_VertexPositionFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VertexPositionFormat(value) {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.put_VertexPositionFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriangleIndexFormat() {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.get_TriangleIndexFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_TriangleIndexFormat(value) {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.put_TriangleIndexFormat(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexNormalFormat() {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.get_VertexNormalFormat()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VertexNormalFormat(value) {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.put_VertexNormalFormat(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IncludeVertexNormals() {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.get_IncludeVertexNormals()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IncludeVertexNormals(value) {
        if (!this.HasProp("__ISpatialSurfaceMeshOptions")) {
            if ((queryResult := this.QueryInterface(ISpatialSurfaceMeshOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialSurfaceMeshOptions := ISpatialSurfaceMeshOptions(outPtr)
        }

        return this.__ISpatialSurfaceMeshOptions.put_IncludeVertexNormals(value)
    }

;@endregion Instance Methods
}
