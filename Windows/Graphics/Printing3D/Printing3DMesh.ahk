#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPrinting3DMesh.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a mesh in the 3D model.
 * @remarks
 * The Printing3DMesh class corresponds to the `<mesh>` element in the 3D Manufacturing Format (3MF) specification. For more info, see the [3MF Specification](https://3mf.io/spec/).
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh
 * @namespace Windows.Graphics.Printing3D
 * @version WindowsRuntime 1.4
 */
class Printing3DMesh extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPrinting3DMesh

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPrinting3DMesh.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the number of triangle vertices.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.vertexcount
     * @type {Integer} 
     */
    VertexCount {
        get => this.get_VertexCount()
        set => this.put_VertexCount(value)
    }

    /**
     * Gets or sets the number of triangle indices.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.indexcount
     * @type {Integer} 
     */
    IndexCount {
        get => this.get_IndexCount()
        set => this.put_IndexCount(value)
    }

    /**
     * Gets or sets the buffer description for vertex positions.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.vertexpositionsdescription
     * @type {Printing3DBufferDescription} 
     */
    VertexPositionsDescription {
        get => this.get_VertexPositionsDescription()
        set => this.put_VertexPositionsDescription(value)
    }

    /**
     * Gets or sets the buffer description for vertex normals.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.vertexnormalsdescription
     * @type {Printing3DBufferDescription} 
     */
    VertexNormalsDescription {
        get => this.get_VertexNormalsDescription()
        set => this.put_VertexNormalsDescription(value)
    }

    /**
     * Gets or sets the buffer description for triangle indices.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.triangleindicesdescription
     * @type {Printing3DBufferDescription} 
     */
    TriangleIndicesDescription {
        get => this.get_TriangleIndicesDescription()
        set => this.put_TriangleIndicesDescription(value)
    }

    /**
     * Gets or sets the buffer description for triangle material indices.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.trianglematerialindicesdescription
     * @type {Printing3DBufferDescription} 
     */
    TriangleMaterialIndicesDescription {
        get => this.get_TriangleMaterialIndicesDescription()
        set => this.put_TriangleMaterialIndicesDescription(value)
    }

    /**
     * Gets a set of mesh buffer descriptions.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.bufferdescriptionset
     * @type {IPropertySet} 
     */
    BufferDescriptionSet {
        get => this.get_BufferDescriptionSet()
    }

    /**
     * Gets a set of mesh buffers.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.bufferset
     * @type {IPropertySet} 
     */
    BufferSet {
        get => this.get_BufferSet()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [Printing3DMesh](printing3dmesh.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Printing3D.Printing3DMesh")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexCount() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_VertexCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_VertexCount(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.put_VertexCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IndexCount() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_IndexCount()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_IndexCount(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.put_IndexCount(value)
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_VertexPositionsDescription() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_VertexPositionsDescription()
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_VertexPositionsDescription(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.put_VertexPositionsDescription(value)
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_VertexNormalsDescription() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_VertexNormalsDescription()
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_VertexNormalsDescription(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.put_VertexNormalsDescription(value)
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_TriangleIndicesDescription() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_TriangleIndicesDescription()
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_TriangleIndicesDescription(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.put_TriangleIndicesDescription(value)
    }

    /**
     * 
     * @returns {Printing3DBufferDescription} 
     */
    get_TriangleMaterialIndicesDescription() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_TriangleMaterialIndicesDescription()
    }

    /**
     * 
     * @param {Printing3DBufferDescription} value 
     * @returns {HRESULT} 
     */
    put_TriangleMaterialIndicesDescription(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.put_TriangleMaterialIndicesDescription(value)
    }

    /**
     * Gets the buffer for vertex positions.
     * @remarks
     * To create the buffer for vertex positions, use [CreateVertexPositions](printing3dmesh_createvertexpositions_738967062.md).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.getvertexpositions
     */
    GetVertexPositions() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.GetVertexPositions()
    }

    /**
     * Creates the buffer for vertex positions.
     * @remarks
     * To access the buffer for vertex positions, use [GetVertexPositions](printing3dmesh_getvertexpositions_2133105161.md).
     * @param {Integer} value The capacity of the buffer, the maximum number of bytes that the [IBuffer](../windows.storage.streams/ibuffer.md) can hold.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.createvertexpositions
     */
    CreateVertexPositions(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.CreateVertexPositions(value)
    }

    /**
     * Gets the buffer for vertex normals.
     * @remarks
     * To create the buffer for vertex normals, use [CreateVertexNormals](printing3dmesh_createvertexnormals_1326037651.md).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.getvertexnormals
     */
    GetVertexNormals() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.GetVertexNormals()
    }

    /**
     * Creates the buffer for vertex normals.
     * @remarks
     * To access the buffer for vertex normals, use [GetVertexNormals](printing3dmesh_getvertexnormals_997243037.md).
     * @param {Integer} value The capacity of the buffer, the maximum number of bytes that the [IBuffer](../windows.storage.streams/ibuffer.md) can hold.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.createvertexnormals
     */
    CreateVertexNormals(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.CreateVertexNormals(value)
    }

    /**
     * Gets the buffer for triangle indices.
     * @remarks
     * To create the buffer for triangle indices, use [CreateTriangleIndices](printing3dmesh_createtriangleindices_1991559687.md).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.gettriangleindices
     */
    GetTriangleIndices() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.GetTriangleIndices()
    }

    /**
     * Creates the buffer for triangle indices.
     * @remarks
     * To access the buffer for triangle indices, use [GetTriangleIndices](printing3dmesh_gettriangleindices_227173511.md).
     * @param {Integer} value The capacity of the buffer, the maximum number of bytes that the [IBuffer](../windows.storage.streams/ibuffer.md) can hold.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.createtriangleindices
     */
    CreateTriangleIndices(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.CreateTriangleIndices(value)
    }

    /**
     * Gets the buffer for triangle material indices.
     * @remarks
     * To create the buffer for triangle material indices, use [CreateTriangleMaterialIndices](printing3dmesh_createtrianglematerialindices_1629565064.md).
     * @returns {IBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.gettrianglematerialindices
     */
    GetTriangleMaterialIndices() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.GetTriangleMaterialIndices()
    }

    /**
     * Creates the buffer for triangle material indices.
     * @remarks
     * To access the buffer for triangle material indices, use [GetTriangleMaterialIndices](printing3dmesh_gettrianglematerialindices_378308768.md).
     * @param {Integer} value The capacity of the buffer, the maximum number of bytes that the [IBuffer](../windows.storage.streams/ibuffer.md) can hold.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.createtrianglematerialindices
     */
    CreateTriangleMaterialIndices(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.CreateTriangleMaterialIndices(value)
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_BufferDescriptionSet() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_BufferDescriptionSet()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_BufferSet() {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.get_BufferSet()
    }

    /**
     * Verifies the mesh has manifold edges and normal triangles.
     * @param {Integer} value Specifies how the mesh is verified.
     * @returns {IAsyncOperation<Printing3DMeshVerificationResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.printing3d.printing3dmesh.verifyasync
     */
    VerifyAsync(value) {
        if (!this.HasProp("__IPrinting3DMesh")) {
            if ((queryResult := this.QueryInterface(IPrinting3DMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPrinting3DMesh := IPrinting3DMesh(outPtr)
        }

        return this.__IPrinting3DMesh.VerifyAsync(value)
    }

;@endregion Instance Methods
}
