#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ScenePbrMaterial.ahk
#Include .\ISceneMetallicRoughnessMaterial.ahk
#Include .\ISceneMetallicRoughnessMaterialStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a material that has that has the appearance of metal.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class SceneMetallicRoughnessMaterial extends ScenePbrMaterial {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneMetallicRoughnessMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneMetallicRoughnessMaterial.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of SceneMetallicRoughnessMaterial.
     * @param {Compositor} compositor_ An instance of the [Compositor](../windows.ui.composition/compositor.md) class.
     * @returns {SceneMetallicRoughnessMaterial} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial.create
     */
    static Create(compositor_) {
        if (!SceneMetallicRoughnessMaterial.HasProp("__ISceneMetallicRoughnessMaterialStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Scenes.SceneMetallicRoughnessMaterial")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISceneMetallicRoughnessMaterialStatics.IID)
            SceneMetallicRoughnessMaterial.__ISceneMetallicRoughnessMaterialStatics := ISceneMetallicRoughnessMaterialStatics(factoryPtr)
        }

        return SceneMetallicRoughnessMaterial.__ISceneMetallicRoughnessMaterialStatics.Create(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the input for material's base color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial.basecolorinput
     * @type {SceneMaterialInput} 
     */
    BaseColorInput {
        get => this.get_BaseColorInput()
        set => this.put_BaseColorInput(value)
    }

    /**
     * Gets or sets a value that indicates the base color.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial.basecolorfactor
     * @type {Vector4} 
     */
    BaseColorFactor {
        get => this.get_BaseColorFactor()
        set => this.put_BaseColorFactor(value)
    }

    /**
     * Gets or sets a value that indicates how metallic the material appears.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial.metallicfactor
     * @type {Float} 
     */
    MetallicFactor {
        get => this.get_MetallicFactor()
        set => this.put_MetallicFactor(value)
    }

    /**
     * Gets or sets the input for how rough or smooth the material is.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial.metallicroughnessinput
     * @type {SceneMaterialInput} 
     */
    MetallicRoughnessInput {
        get => this.get_MetallicRoughnessInput()
        set => this.put_MetallicRoughnessInput(value)
    }

    /**
     * Gets or sets a value that indicates how rough or smooth the material appears.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenemetallicroughnessmaterial.roughnessfactor
     * @type {Float} 
     */
    RoughnessFactor {
        get => this.get_RoughnessFactor()
        set => this.put_RoughnessFactor(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_BaseColorInput() {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.get_BaseColorInput()
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_BaseColorInput(value) {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.put_BaseColorInput(value)
    }

    /**
     * 
     * @returns {Vector4} 
     */
    get_BaseColorFactor() {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.get_BaseColorFactor()
    }

    /**
     * 
     * @param {Vector4} value 
     * @returns {HRESULT} 
     */
    put_BaseColorFactor(value) {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.put_BaseColorFactor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MetallicFactor() {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.get_MetallicFactor()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MetallicFactor(value) {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.put_MetallicFactor(value)
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_MetallicRoughnessInput() {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.get_MetallicRoughnessInput()
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_MetallicRoughnessInput(value) {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.put_MetallicRoughnessInput(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RoughnessFactor() {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.get_RoughnessFactor()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RoughnessFactor(value) {
        if (!this.HasProp("__ISceneMetallicRoughnessMaterial")) {
            if ((queryResult := this.QueryInterface(ISceneMetallicRoughnessMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneMetallicRoughnessMaterial := ISceneMetallicRoughnessMaterial(outPtr)
        }

        return this.__ISceneMetallicRoughnessMaterial.put_RoughnessFactor(value)
    }

;@endregion Instance Methods
}
