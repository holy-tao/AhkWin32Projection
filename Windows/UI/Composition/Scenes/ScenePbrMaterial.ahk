#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SceneMaterial.ahk
#Include .\IScenePbrMaterial.ahk
#Include .\IScenePbrMaterialFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a material that uses Physically Based Rendering (PBR).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial
 * @namespace Windows.UI.Composition.Scenes
 * @version WindowsRuntime 1.4
 */
class ScenePbrMaterial extends SceneMaterial {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScenePbrMaterial

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScenePbrMaterial.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the alpha cutoff for the material.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.alphacutoff
     * @type {Float} 
     */
    AlphaCutoff {
        get => this.get_AlphaCutoff()
        set => this.put_AlphaCutoff(value)
    }

    /**
     * Gets or sets the alpha mode for the material.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.alphamode
     * @type {Integer} 
     */
    AlphaMode {
        get => this.get_AlphaMode()
        set => this.put_AlphaMode(value)
    }

    /**
     * Gets or sets the input for the material's emissive value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.emissiveinput
     * @type {SceneMaterialInput} 
     */
    EmissiveInput {
        get => this.get_EmissiveInput()
        set => this.put_EmissiveInput(value)
    }

    /**
     * Gets or sets the material's emissive value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.emissivefactor
     * @type {Vector3} 
     */
    EmissiveFactor {
        get => this.get_EmissiveFactor()
        set => this.put_EmissiveFactor(value)
    }

    /**
     * Gets or sets a value that indicates whether the material has two sides.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.isdoublesided
     * @type {Boolean} 
     */
    IsDoubleSided {
        get => this.get_IsDoubleSided()
        set => this.put_IsDoubleSided(value)
    }

    /**
     * Gets or sets the input for material's normal.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.normalinput
     * @type {SceneMaterialInput} 
     */
    NormalInput {
        get => this.get_NormalInput()
        set => this.put_NormalInput(value)
    }

    /**
     * Gets or sets the normal scale for the material.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.normalscale
     * @type {Float} 
     */
    NormalScale {
        get => this.get_NormalScale()
        set => this.put_NormalScale(value)
    }

    /**
     * Gets or sets the input for the material's occlusion.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.occlusioninput
     * @type {SceneMaterialInput} 
     */
    OcclusionInput {
        get => this.get_OcclusionInput()
        set => this.put_OcclusionInput(value)
    }

    /**
     * Gets or sets the occlusion strength.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.scenes.scenepbrmaterial.occlusionstrength
     * @type {Float} 
     */
    OcclusionStrength {
        get => this.get_OcclusionStrength()
        set => this.put_OcclusionStrength(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AlphaCutoff() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_AlphaCutoff()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AlphaCutoff(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_AlphaCutoff(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AlphaMode() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_AlphaMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AlphaMode(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_AlphaMode(value)
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_EmissiveInput() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_EmissiveInput()
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_EmissiveInput(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_EmissiveInput(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_EmissiveFactor() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_EmissiveFactor()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_EmissiveFactor(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_EmissiveFactor(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDoubleSided() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_IsDoubleSided()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDoubleSided(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_IsDoubleSided(value)
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_NormalInput() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_NormalInput()
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_NormalInput(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_NormalInput(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NormalScale() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_NormalScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_NormalScale(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_NormalScale(value)
    }

    /**
     * 
     * @returns {SceneMaterialInput} 
     */
    get_OcclusionInput() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_OcclusionInput()
    }

    /**
     * 
     * @param {SceneMaterialInput} value 
     * @returns {HRESULT} 
     */
    put_OcclusionInput(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_OcclusionInput(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OcclusionStrength() {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.get_OcclusionStrength()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OcclusionStrength(value) {
        if (!this.HasProp("__IScenePbrMaterial")) {
            if ((queryResult := this.QueryInterface(IScenePbrMaterial.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScenePbrMaterial := IScenePbrMaterial(outPtr)
        }

        return this.__IScenePbrMaterial.put_OcclusionStrength(value)
    }

;@endregion Instance Methods
}
