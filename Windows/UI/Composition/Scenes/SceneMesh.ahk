#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneObject.ahk
#Include .\ISceneMesh.ahk
#Include .\ISceneMeshStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a mesh (the list of vertices that describe the polygons that make up a scene).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemesh
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneMesh extends SceneObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneMesh

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneMesh.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of SceneMesh.
     * @param {Compositor} compositor_ An instance of the [Compositor](../windows.ui.composition/compositor.md) class.
     * @returns {SceneMesh} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemesh.create
     */
    static Create(compositor_) {
        if (!SceneMesh.HasProp("__ISceneMeshStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Scenes.SceneMesh")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISceneMeshStatics.IID)
            SceneMesh.__ISceneMeshStatics := ISceneMeshStatics(factoryPtr)
        }

        return SceneMesh.__ISceneMeshStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the bounds of the mesh.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemesh.bounds
     * @type {SceneBoundingBox} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * Gets or sets a value that indicates how the vertex data is interpreted by the graphics pipeline and rendered on screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemesh.primitivetopology
     * @type {Integer} 
     */
    PrimitiveTopology {
        get => this.get_PrimitiveTopology()
        set => this.put_PrimitiveTopology(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SceneBoundingBox} 
     */
    get_Bounds() {
        if (!this.HasProp("__ISceneMesh")) {
            if ((queryResult := this.QueryInterface(ISceneMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMesh := ISceneMesh(outPtr)
        }

        return this.__ISceneMesh.get_Bounds()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PrimitiveTopology() {
        if (!this.HasProp("__ISceneMesh")) {
            if ((queryResult := this.QueryInterface(ISceneMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMesh := ISceneMesh(outPtr)
        }

        return this.__ISceneMesh.get_PrimitiveTopology()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PrimitiveTopology(value) {
        if (!this.HasProp("__ISceneMesh")) {
            if ((queryResult := this.QueryInterface(ISceneMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMesh := ISceneMesh(outPtr)
        }

        return this.__ISceneMesh.put_PrimitiveTopology(value)
    }

    /**
     * Creates a copy of information about the mesh for use by this SceneMesh.
     * @param {Integer} semantic The attribute semantic.
     * @param {Integer} format The pixel format.
     * @param {MemoryBuffer} memory The memory buffer.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemesh.fillmeshattribute
     */
    FillMeshAttribute(semantic, format, memory) {
        if (!this.HasProp("__ISceneMesh")) {
            if ((queryResult := this.QueryInterface(ISceneMesh.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMesh := ISceneMesh(outPtr)
        }

        return this.__ISceneMesh.FillMeshAttribute(semantic, format, memory)
    }

;@endregion Instance Methods
}
