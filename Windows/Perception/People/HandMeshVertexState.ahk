#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHandMeshVertexState.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the vertex buffer and other state needed to render the hand mesh.
 * @remarks
 * This state update's vertex positions and normals filled by [GetVertices](handmeshvertexstate_getvertices_574524283.md) are expressed relative to the [CoordinateSystem](handmeshvertexstate_coordinatesystem.md) property.  Each frame, you must always get the new vertices and then locate their new coordinate system to accurately position the vertices in the world.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshvertexstate
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class HandMeshVertexState extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHandMeshVertexState

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHandMeshVertexState.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the coordinate system within which this frame's vertex positions and normals are expressed.
     * @remarks
     * The vertex positions and normals filled by [GetVertices](handmeshvertexstate_getvertices_574524283.md) are expressed relative to the coordinate system returned by this state object's **CoordinateSystem** property.  Each frame, you must always get the new vertices and then locate their new coordinate system to accurately position the hand mesh in the world.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshvertexstate.coordinatesystem
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * Gets the timestamp at which the vertex positions and normals were last updated.
     * @remarks
     * The vertex positions and normals will generally be updated each frame.  However, if the **UpdateTimestamp** remains the same across two frames, you can skip ingesting the vertex buffer, as it also remains the same.  Note that you should still get the latest [CoordinateSystem](handmeshvertexstate_coordinatesystem.md) value every frame even if the vertex buffer hasn't changed, to best reposition the old mesh for the hand's new location this frame.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshvertexstate.updatetimestamp
     * @type {PerceptionTimestamp} 
     */
    UpdateTimestamp {
        get => this.get_UpdateTimestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        if (!this.HasProp("__IHandMeshVertexState")) {
            if ((queryResult := this.QueryInterface(IHandMeshVertexState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshVertexState := IHandMeshVertexState(outPtr)
        }

        return this.__IHandMeshVertexState.get_CoordinateSystem()
    }

    /**
     * Fills a vertex buffer for this hand mesh model.
     * @remarks
     * Get [VertexCount](handmeshobserver_vertexcount.md) first to know how many elements to allocate in the vertex buffer you pass in here.
     * 
     * The filled vertex positions and normals are expressed relative to the coordinate system returned by this state object's [CoordinateSystem](handmeshvertexstate_coordinatesystem.md) property.  Each frame, you must always get the new vertices and then locate their new coordinate system to accurately position the hand mesh in the world.
     * 
     * The hand mesh's vertex buffer data will change each frame, while the vertex count will not.  You can therefore refill the same vertex buffer every frame.
     * @param {Pointer<Integer>} vertices_length 
     * @param {Pointer<Pointer<HandMeshVertex>>} vertices The vertex buffer to fill.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshvertexstate.getvertices
     */
    GetVertices(vertices_length, vertices) {
        if (!this.HasProp("__IHandMeshVertexState")) {
            if ((queryResult := this.QueryInterface(IHandMeshVertexState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshVertexState := IHandMeshVertexState(outPtr)
        }

        return this.__IHandMeshVertexState.GetVertices(vertices_length, vertices)
    }

    /**
     * 
     * @returns {PerceptionTimestamp} 
     */
    get_UpdateTimestamp() {
        if (!this.HasProp("__IHandMeshVertexState")) {
            if ((queryResult := this.QueryInterface(IHandMeshVertexState.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshVertexState := IHandMeshVertexState(outPtr)
        }

        return this.__IHandMeshVertexState.get_UpdateTimestamp()
    }

;@endregion Instance Methods
}
