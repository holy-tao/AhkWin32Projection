#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHandMeshObserver.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides mesh updates each frame that track the detected shape of a hand.
 * @remarks
 * Creating a **HandMeshObserver** subscribes you to hand mesh updates for a given [SpatialInteractionSource](../windows.ui.input.spatial/spatialinteractionsource.md) that tracks the detected shape of that hand.
 * 
 * When users are directly interacting with virtual objects with their hands, you may wish to render a visualization of the hands to increase the user's confidence in their interactions.  By creating a **HandMeshObserver**, you can get a fixed index buffer for the hand up front by calling [GetTriangleIndices](handmeshobserver_gettriangleindices_2079708971.md), and then an updated vertex buffer each frame by calling [GetVertexStateForPose](handmeshobserver_getvertexstateforpose_1608128188.md).  With these buffers, you can render a live visualization of the user's hand.
 * 
 * The hand mesh's index buffer will not change for the lifetime of the **HandMeshObserver**.  The hand mesh's vertex buffer contents will be updated each frame, while the vertex count will not.  You can therefore refill the same vertex buffer every frame.
 * 
 * You create a **HandMeshObserver** for a given interaction source by calling [SpatialInteractionSource.TryCreateHandMeshObserverAsync](../windows.ui.input.spatial/spatialinteractionsource_trycreatehandmeshobserverasync_89275821.md) or [SpatialInteractionSource.TryCreateHandMeshObserver](../windows.ui.input.spatial/spatialinteractionsource_trycreatehandmeshobserver_1809408895.md).  It can take more than a frame to initialize the app's subscription to hand mesh updates.  You should only call the synchronous version of the method from a background thread.  If you are calling from a UI thread, render thread or update thread, you should call the asynchronous version instead.
 * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver
 * @namespace Windows.Perception.People
 * @version WindowsRuntime 1.4
 */
class HandMeshObserver extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHandMeshObserver

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHandMeshObserver.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The [SpatialInteractionSource](../windows.ui.input.spatial/spatialinteractionsource.md) whose hand mesh is tracked by this [HandMeshObserver](handmeshobserver.md).
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.source
     * @type {SpatialInteractionSource} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * Gets the number of elements in the index buffer for this hand mesh model.
     * @remarks
     * This count tells you how many elements to allocate in the index buffer you'll fill using [GetTriangleIndices](handmeshobserver_gettriangleindices_2079708971.md).
     * 
     * The hand mesh's index buffer will not change for the lifetime of the [HandMeshObserver](handmeshobserver.md).
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.triangleindexcount
     * @type {Integer} 
     */
    TriangleIndexCount {
        get => this.get_TriangleIndexCount()
    }

    /**
     * Gets the count of vertices for this hand.
     * @remarks
     * This count tells your app how many elements to allocate in the vertex buffer you'll fill using [GetVertices](handmeshvertexstate_getvertices_574524283.md) each frame after you call [GetVertexStateForPose](handmeshobserver_getvertexstateforpose_1608128188.md).
     * 
     * The hand mesh's vertex buffer data will change each frame, while the vertex count will not.  You can therefore refill the same vertex buffer every frame.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.vertexcount
     * @type {Integer} 
     */
    VertexCount {
        get => this.get_VertexCount()
    }

    /**
     * Gets the current neutral [HandPose](handpose.md) for this hand.
     * @remarks
     * Some hand mesh visualizations may require an initial analysis or processing of the hand mesh relative to the joints of the hand.  For example, a visualization may pre-generate a UV mapping for the hand mesh vertices by raycasting outward from key joints against the mesh to find key vertices.
     * 
     * To avoid biasing such static analysis with the arbitrary hand pose detected in the first frame, you can request the hand's neutral hand pose (a relaxed open hand pose), and then call [GetVertexStateForPose](handmeshobserver_getvertexstateforpose_1608128188.md) with that neutral pose instead.  This will get you a neutral vertex buffer that is better suited for static analysis.
     * 
     * This neutral pose is fairly stable, but will evolve over time as the system's estimate of the user's hand shape is updated.  You can detect when the neutral pose updates by observing a change in the [NeutralPoseVersion](handmeshobserver_neutralposeversion.md).  When there is a neutral pose update, you may wish to repeat some or all of your analysis.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.neutralpose
     * @type {HandPose} 
     */
    NeutralPose {
        get => this.get_NeutralPose()
    }

    /**
     * Gets the version of the [NeutralPose](handmeshobserver_neutralpose.md) for this hand.
     * @remarks
     * The hand mesh's [NeutralPose](handmeshobserver_neutralpose.md) is fairly stable, but will evolve over time as the system's estimate of the user's hand shape is updated.  You can detect when the neutral pose updates by observing a change in the **NeutralPoseVersion**.  When there is a neutral pose update, you may wish to repeat some or all of the static analysis you performed on the mesh.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.neutralposeversion
     * @type {Integer} 
     */
    NeutralPoseVersion {
        get => this.get_NeutralPoseVersion()
    }

    /**
     * Gets a hand mesh model ID to identify the same index buffer across multiple source detection and loss events.
     * @remarks
     * If your app observes the same hand mesh model ID again for a new interaction source, it can render using the previous source's already-loaded index buffer without transferring it to the GPU again.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.modelid
     * @type {Integer} 
     */
    ModelId {
        get => this.get_ModelId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SpatialInteractionSource} 
     */
    get_Source() {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.get_Source()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TriangleIndexCount() {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.get_TriangleIndexCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VertexCount() {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.get_VertexCount()
    }

    /**
     * Fills an index buffer for this hand mesh model.
     * @remarks
     * Get [TriangleIndexCount](handmeshobserver_triangleindexcount.md) first to know how many elements to allocate in the index buffer you pass in here.
     * 
     * The hand mesh's index buffer will not change for the lifetime of the [HandMeshObserver](handmeshobserver.md).
     * @param {Pointer<Integer>} indices_length 
     * @param {Pointer<Pointer<Integer>>} indices The index buffer to fill.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.gettriangleindices
     */
    GetTriangleIndices(indices_length, indices) {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.GetTriangleIndices(indices_length, indices)
    }

    /**
     * Gets the vertex buffer and other state needed to render the hand mesh for a given frame's hand pose, or for the hand mesh's neutral pose.
     * @param {HandPose} handPose_ The hand pose for which to get the vertex state.
     * @returns {HandMeshVertexState} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.people.handmeshobserver.getvertexstateforpose
     */
    GetVertexStateForPose(handPose_) {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.GetVertexStateForPose(handPose_)
    }

    /**
     * 
     * @returns {HandPose} 
     */
    get_NeutralPose() {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.get_NeutralPose()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NeutralPoseVersion() {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.get_NeutralPoseVersion()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ModelId() {
        if (!this.HasProp("__IHandMeshObserver")) {
            if ((queryResult := this.QueryInterface(IHandMeshObserver.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHandMeshObserver := IHandMeshObserver(outPtr)
        }

        return this.__IHandMeshObserver.get_ModelId()
    }

;@endregion Instance Methods
}
