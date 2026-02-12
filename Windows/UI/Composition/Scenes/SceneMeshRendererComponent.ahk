#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneRendererComponent.ahk
#Include .\ISceneMeshRendererComponent.ahk
#Include .\ISceneMeshRendererComponentStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a component that renders a SceneMesh.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshrenderercomponent
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneMeshRendererComponent extends SceneRendererComponent {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneMeshRendererComponent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneMeshRendererComponent.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of SceneMeshRendererComponent.
     * @param {Compositor} compositor_ An instance of the [Compositor](../windows.ui.composition/compositor.md) class.
     * @returns {SceneMeshRendererComponent} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshrenderercomponent.create
     */
    static Create(compositor_) {
        if (!SceneMeshRendererComponent.HasProp("__ISceneMeshRendererComponentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Scenes.SceneMeshRendererComponent")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISceneMeshRendererComponentStatics.IID)
            SceneMeshRendererComponent.__ISceneMeshRendererComponentStatics := ISceneMeshRendererComponentStatics(factoryPtr)
        }

        return SceneMeshRendererComponent.__ISceneMeshRendererComponentStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the material that describes how the mesh surface is rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshrenderercomponent.material
     * @type {SceneMaterial} 
     */
    Material {
        get => this.get_Material()
        set => this.put_Material(value)
    }

    /**
     * Gets or sets the SceneMesh to be rendered.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshrenderercomponent.mesh
     * @type {SceneMesh} 
     */
    Mesh {
        get => this.get_Mesh()
        set => this.put_Mesh(value)
    }

    /**
     * Gets the UV mappings for the material to the mesh.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemeshrenderercomponent.uvmappings
     * @type {SceneMeshMaterialAttributeMap} 
     */
    UVMappings {
        get => this.get_UVMappings()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SceneMaterial} 
     */
    get_Material() {
        if (!this.HasProp("__ISceneMeshRendererComponent")) {
            if ((queryResult := this.QueryInterface(ISceneMeshRendererComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMeshRendererComponent := ISceneMeshRendererComponent(outPtr)
        }

        return this.__ISceneMeshRendererComponent.get_Material()
    }

    /**
     * 
     * @param {SceneMaterial} value 
     * @returns {HRESULT} 
     */
    put_Material(value) {
        if (!this.HasProp("__ISceneMeshRendererComponent")) {
            if ((queryResult := this.QueryInterface(ISceneMeshRendererComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMeshRendererComponent := ISceneMeshRendererComponent(outPtr)
        }

        return this.__ISceneMeshRendererComponent.put_Material(value)
    }

    /**
     * 
     * @returns {SceneMesh} 
     */
    get_Mesh() {
        if (!this.HasProp("__ISceneMeshRendererComponent")) {
            if ((queryResult := this.QueryInterface(ISceneMeshRendererComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMeshRendererComponent := ISceneMeshRendererComponent(outPtr)
        }

        return this.__ISceneMeshRendererComponent.get_Mesh()
    }

    /**
     * 
     * @param {SceneMesh} value 
     * @returns {HRESULT} 
     */
    put_Mesh(value) {
        if (!this.HasProp("__ISceneMeshRendererComponent")) {
            if ((queryResult := this.QueryInterface(ISceneMeshRendererComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMeshRendererComponent := ISceneMeshRendererComponent(outPtr)
        }

        return this.__ISceneMeshRendererComponent.put_Mesh(value)
    }

    /**
     * 
     * @returns {SceneMeshMaterialAttributeMap} 
     */
    get_UVMappings() {
        if (!this.HasProp("__ISceneMeshRendererComponent")) {
            if ((queryResult := this.QueryInterface(ISceneMeshRendererComponent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMeshRendererComponent := ISceneMeshRendererComponent(outPtr)
        }

        return this.__ISceneMeshRendererComponent.get_UVMappings()
    }

;@endregion Instance Methods
}
