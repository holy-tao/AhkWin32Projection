#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionLight.ahk
#Include .\IPointLight.ahk
#Include .\IPointLight2.ahk
#Include .\IPointLight3.ahk
#Include ..\..\..\Guid.ahk

/**
 * A point source of light that emanates light in all directions.
 * @remarks
 * A PointLight gives off light equally in all directions.
 * 
 * PointLight is one of the four light types derived from [CompositionLight](compositionlight.md).
 * 
 * | Light | Description |
 * |---|---|
 * | [AmbientLight](ambientlight.md) | A light source that emits non directional light that appears to have been reflected by everything in the scene. |
 * | [DistantLight](distantlight.md) | An infinitely large distant light source that emits light in a single direction. |
 * | PointLight | A point source of light that emits light in all directions. |
 * | [SpotLight](spotlight.md) | A light source that emits inner and outer cones of light. |
 * 
 * > [!NOTE]
 * > A Visual cannot be targeted by more than two non-ambient lights (PointLight, SpotLight or DistantLight).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class PointLight extends CompositionLight {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointLight

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointLight.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Color of the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * The constant coefficient in the light's attenuation equation. Controls light intensity.
     * @remarks
     * The PointLight.ConstantAttenuation property is part of the attenuation equation which also includes PointLight.LinearAttenuation and PointLight.QuadraticAttenuation:
     * 
     * <img src="images/attenuationequation.png" alt="1/(Constant+Linear*(Distance/100)+Quadratic*(Distance/100)(Distance/100))" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.constantattenuation
     * @type {Float} 
     */
    ConstantAttenuation {
        get => this.get_ConstantAttenuation()
        set => this.put_ConstantAttenuation(value)
    }

    /**
     * The Visual used to determine the light's offset. The light's offset property is relative to this Visual's coordinate space.
     *     **PointLight.CoordinateSpace**
     *    is a required property. If 
     *     **PointLight.CoordinateSpace**
     *    is not set, the [PointLight](pointlight.md) will not render.
     * @remarks
     * PointLight.Offset is relative to 
     *     **PointLight.CoordinateSpace**
     *   . Every Visual has an implicit 3D coordinate space, defined in this way:
     * 
     * <img src="images/coordinatespace.png" alt="X-axis runs from the left edge to the right edge of the visual.  Y-axis runs from the top of the visual to the bottom.  Z-axis is perpandicular to the visual." />
     * 
     *  X direction is from left to right. Y direction is from top to bottom. Z direction is point out of the plane. The original point of this coordinate is the upper-left corner of the visual, and the unit is DIP. A light's offset is defined in this coordinate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.coordinatespace
     * @type {Visual} 
     */
    CoordinateSpace {
        get => this.get_CoordinateSpace()
        set => this.put_CoordinateSpace(value)
    }

    /**
     * The linear coefficient in the light's attenuation equation that determines how the light falls-off with distance.
     * @remarks
     * The PointLight.LinearAttenuation property is part of the attenuation equation which also contains PointLight.ConstantAttenuation and PointLight.QuadraticAttenuation:
     * 
     * <img src="images/attenuationequation.png" alt="1/(Constant+Linear*(Distance/100)+Quadratic*(Distance/100)*(Distance/100))" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.linearattenuation
     * @type {Float} 
     */
    LinearAttenuation {
        get => this.get_LinearAttenuation()
        set => this.put_LinearAttenuation(value)
    }

    /**
     * Offset of the light source relative to its coordinate space Visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.offset
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The quadratic portion of the attenuation equation that determines how the light falls off with distance.
     * @remarks
     * The 
     *     **PointLight.QuadraticAttenuation**
     *    property is part of the attenuation equation which also includes [PointLight.LinearAttenuation](pointlight_linearattenuation.md) and [PointLight.ConstantAttenuation](pointlight_constantattenuation.md):
     * 
     * <img src="images/attenuationequation.png" alt="1/(Constant+Linear*(Distance/100)+Quadratic*(Distance/100)*(Distance/100))" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.quadraticattenuation
     * @type {Float} 
     */
    QuadraticAttenuation {
        get => this.get_QuadraticAttenuation()
        set => this.put_QuadraticAttenuation(value)
    }

    /**
     * Gets or sets the intensity of the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.intensity
     * @type {Float} 
     */
    Intensity {
        get => this.get_Intensity()
        set => this.put_Intensity(value)
    }

    /**
     * Gets or sets the minimum range at which this light is effective.
     * @remarks
     * If the difference between MinAttenuationCutoff and MaxAttenuationCutoff is 0 or negative, the range is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.minattenuationcutoff
     * @type {Float} 
     */
    MinAttenuationCutoff {
        get => this.get_MinAttenuationCutoff()
        set => this.put_MinAttenuationCutoff(value)
    }

    /**
     * Gets or sets the maximum range at which this light is effective.
     * @remarks
     * If the difference between MinAttenuationCutoff and MaxAttenuationCutoff is 0 or negative, the range is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pointlight.maxattenuationcutoff
     * @type {Float} 
     */
    MaxAttenuationCutoff {
        get => this.get_MaxAttenuationCutoff()
        set => this.put_MaxAttenuationCutoff(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.put_Color(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ConstantAttenuation() {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.get_ConstantAttenuation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ConstantAttenuation(value) {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.put_ConstantAttenuation(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_CoordinateSpace() {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.get_CoordinateSpace()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_CoordinateSpace(value) {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.put_CoordinateSpace(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LinearAttenuation() {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.get_LinearAttenuation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LinearAttenuation(value) {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.put_LinearAttenuation(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.get_Offset()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_QuadraticAttenuation() {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.get_QuadraticAttenuation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_QuadraticAttenuation(value) {
        if (!this.HasProp("__IPointLight")) {
            if ((queryResult := this.QueryInterface(IPointLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight := IPointLight(outPtr)
        }

        return this.__IPointLight.put_QuadraticAttenuation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Intensity() {
        if (!this.HasProp("__IPointLight2")) {
            if ((queryResult := this.QueryInterface(IPointLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight2 := IPointLight2(outPtr)
        }

        return this.__IPointLight2.get_Intensity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Intensity(value) {
        if (!this.HasProp("__IPointLight2")) {
            if ((queryResult := this.QueryInterface(IPointLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight2 := IPointLight2(outPtr)
        }

        return this.__IPointLight2.put_Intensity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinAttenuationCutoff() {
        if (!this.HasProp("__IPointLight3")) {
            if ((queryResult := this.QueryInterface(IPointLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight3 := IPointLight3(outPtr)
        }

        return this.__IPointLight3.get_MinAttenuationCutoff()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinAttenuationCutoff(value) {
        if (!this.HasProp("__IPointLight3")) {
            if ((queryResult := this.QueryInterface(IPointLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight3 := IPointLight3(outPtr)
        }

        return this.__IPointLight3.put_MinAttenuationCutoff(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAttenuationCutoff() {
        if (!this.HasProp("__IPointLight3")) {
            if ((queryResult := this.QueryInterface(IPointLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight3 := IPointLight3(outPtr)
        }

        return this.__IPointLight3.get_MaxAttenuationCutoff()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxAttenuationCutoff(value) {
        if (!this.HasProp("__IPointLight3")) {
            if ((queryResult := this.QueryInterface(IPointLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointLight3 := IPointLight3(outPtr)
        }

        return this.__IPointLight3.put_MaxAttenuationCutoff(value)
    }

;@endregion Instance Methods
}
