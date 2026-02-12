#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISceneLightingEffect.ahk
#Include .\ISceneLightingEffect2.ahk
#Include ..\..\..\Graphics\Effects\IGraphicsEffect.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Controls the reflective properties of a SpriteVisual. A SceneLightingEffect will overwrite [CompositionLight](../windows.ui.composition/compositionlight.md) defaults. It is used to control the reflective properties of a SpriteVisual. A NormalMap can be used as an input source but is not required.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect
 * @namespace Windows.UI.Composition.Effects
 * @version WindowsRuntime 1.4
 */
class SceneLightingEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISceneLightingEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISceneLightingEffect.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The proportion of predefined AmbientLight used by the effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.ambientamount
     * @type {Float} 
     */
    AmbientAmount {
        get => this.get_AmbientAmount()
        set => this.put_AmbientAmount(value)
    }

    /**
     * Intensity of the diffuse light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.diffuseamount
     * @type {Float} 
     */
    DiffuseAmount {
        get => this.get_DiffuseAmount()
        set => this.put_DiffuseAmount(value)
    }

    /**
     * The normal map for the effect.
     * @remarks
     * A normal map is used to assign normals to a target Visual. This creates an effect of a texture where a normal pointing towards the light will be brighter and a normal pointing away will be dimmer. If the NormalMapSource property is not set, the normal described by Vector3.UnitZ will be used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.normalmapsource
     * @type {IGraphicsEffectSource} 
     */
    NormalMapSource {
        get => this.get_NormalMapSource()
        set => this.put_NormalMapSource(value)
    }

    /**
     * Intensity of the specular light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.specularamount
     * @type {Float} 
     */
    SpecularAmount {
        get => this.get_SpecularAmount()
        set => this.put_SpecularAmount(value)
    }

    /**
     * Specular power for the Blinn-Phong lighting model.
     * @remarks
     * The 
     *     **SpecularShine**
     *    property provides the exponent for the specular term in the Phong lighting equation. A larger value corresponds to a more reflective surface. The value must be between 1.0 and 128.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.specularshine
     * @type {Float} 
     */
    SpecularShine {
        get => this.get_SpecularShine()
        set => this.put_SpecularShine(value)
    }

    /**
     * Gets or sets a value that indicates how the reflectance of a [SceneLightingEffect](scenelightingeffect.md) is modeled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.reflectancemodel
     * @type {Integer} 
     */
    ReflectanceModel {
        get => this.get_ReflectanceModel()
        set => this.put_ReflectanceModel(value)
    }

    /**
     * Name of the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.effects.scenelightingeffect.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [SceneLightingEffect](scenelightingeffect.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Effects.SceneLightingEffect")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AmbientAmount() {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.get_AmbientAmount()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AmbientAmount(value) {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.put_AmbientAmount(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DiffuseAmount() {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.get_DiffuseAmount()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DiffuseAmount(value) {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.put_DiffuseAmount(value)
    }

    /**
     * 
     * @returns {IGraphicsEffectSource} 
     */
    get_NormalMapSource() {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.get_NormalMapSource()
    }

    /**
     * 
     * @param {IGraphicsEffectSource} value 
     * @returns {HRESULT} 
     */
    put_NormalMapSource(value) {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.put_NormalMapSource(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpecularAmount() {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.get_SpecularAmount()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpecularAmount(value) {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.put_SpecularAmount(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpecularShine() {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.get_SpecularShine()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpecularShine(value) {
        if (!this.HasProp("__ISceneLightingEffect")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect := ISceneLightingEffect(outPtr)
        }

        return this.__ISceneLightingEffect.put_SpecularShine(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReflectanceModel() {
        if (!this.HasProp("__ISceneLightingEffect2")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect2 := ISceneLightingEffect2(outPtr)
        }

        return this.__ISceneLightingEffect2.get_ReflectanceModel()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ReflectanceModel(value) {
        if (!this.HasProp("__ISceneLightingEffect2")) {
            if ((queryResult := this.QueryInterface(ISceneLightingEffect2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISceneLightingEffect2 := ISceneLightingEffect2(outPtr)
        }

        return this.__ISceneLightingEffect2.put_ReflectanceModel(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IGraphicsEffect")) {
            if ((queryResult := this.QueryInterface(IGraphicsEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsEffect := IGraphicsEffect(outPtr)
        }

        return this.__IGraphicsEffect.get_Name()
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HRESULT} 
     */
    put_Name(name) {
        if (!this.HasProp("__IGraphicsEffect")) {
            if ((queryResult := this.QueryInterface(IGraphicsEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGraphicsEffect := IGraphicsEffect(outPtr)
        }

        return this.__IGraphicsEffect.put_Name(name)
    }

;@endregion Instance Methods
}
