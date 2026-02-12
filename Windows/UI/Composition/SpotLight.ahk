#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionLight.ahk
#Include .\ISpotLight.ahk
#Include .\ISpotLight2.ahk
#Include .\ISpotLight3.ahk
#Include ..\..\..\Guid.ahk

/**
 * A light source that casts inner and outer cones of light. For example, a flashlight.
 * @remarks
 * SpotLight is one of the four light types derived from [CompositionLight](compositionlight.md).
 * 
 * | Light | Description |
 * |---|---|
 * | [AmbientLight](ambientlight.md) | A light source that emits non directional light that appears to have been reflected by everything in the scene. |
 * | [DistantLight](distantlight.md) | An infinitely large distant light source that emits light in a single direction. |
 * | [PointLight](pointlight.md) | A point source of light that emits light in all directions. |
 * | SpotLight | A light source that emits inner and outer cones of light. |
 * 
 * > [!NOTE]
 * > A Visual cannot be targeted by more than two non-ambient lights (PointLight, SpotLight or DistantLight).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class SpotLight extends CompositionLight {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpotLight

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpotLight.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The constant coefficient in the light's attenuation equation. Controls light intensity. Animatable.
     * @remarks
     * The SpotLight.ConstantAttenuation property is part of the attenuation equation which also includes SpotLight.LinearAttenuation and SpotLight.QuadraticAttenuation:
     * 
     * <img src="images/attenuationequation.png" alt="1/(Constant+Linear*(Distance/100)+Quadratic*(Distance/100)*(Distance/100))" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.constantattenuation
     * @type {Float} 
     */
    ConstantAttenuation {
        get => this.get_ConstantAttenuation()
        set => this.put_ConstantAttenuation(value)
    }

    /**
     * The Visual used to determine the light's direction and offset. The light's offset and direction properties are relative to this Visual's coordinate space.
     *     **SpotLight.CoordinateSpace**
     *    is a required property. If 
     *     **SpotLight.CoordinateSpace**
     *    is not set, the SpotLight will not render.
     * @remarks
     * [SpotLight.Offset](spotlight_offset.md) and[ SpotLight.Direction](spotlight_direction.md) are relative to 
     *     **Spotlight.CoordiateSpace**
     *   . Every Visual has an implicit 3D coordinate space, defined in this way:
     * 
     * <img src="images/coordinatespace.png" alt="X-axis runs from the left edge to the right edge of the visual.  Y-axis runs from the top of the visual to the bottom.  Z-axis is perpandicular to the visual." />
     * 
     * X direction is from left to right. Y direction is from top to bottom. Z direction is pointing out of the plane. The original point of this coordinate is the upper-left corner of the visual, and the unit is DIP. A light’s offset and direction are defined in this coordinate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.coordinatespace
     * @type {Visual} 
     */
    CoordinateSpace {
        get => this.get_CoordinateSpace()
        set => this.put_CoordinateSpace(value)
    }

    /**
     * The direction in which the light is pointing, specified relative to its CoordinateSpace Visual.
     * @remarks
     * SpotLight.Direction is relative to [SpotLight.CoordinateSpace](spotlight_coordinatespace.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.direction
     * @type {Vector3} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * The SpotLight’s inner cone angle, expressed as a semi-vertical angle in radians. Animatable.
     * @remarks
     * **InnerConeAngle**
     *    is not bound to [OuterConeAngle](spotlight_outerconeangle.md) and can be greater than [OuterConeAngle](spotlight_outerconeangle.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.innerconeangle
     * @type {Float} 
     */
    InnerConeAngle {
        get => this.get_InnerConeAngle()
        set => this.put_InnerConeAngle(value)
    }

    /**
     * The SpotLight’s inner cone angle, expressed as a semi-vertical angle in degrees. Animatable.
     * @remarks
     * **InnerConeAngleInDegrees**
     *    is not bound to [OuterConeAngleInDegrees](spotlight_outerconeangleindegrees.md) and can be greater than [OuterConeAngleInDegrees](spotlight_outerconeangleindegrees.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.innerconeangleindegrees
     * @type {Float} 
     */
    InnerConeAngleInDegrees {
        get => this.get_InnerConeAngleInDegrees()
        set => this.put_InnerConeAngleInDegrees(value)
    }

    /**
     * Color of the spotlight's inner cone. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.innerconecolor
     * @type {Color} 
     */
    InnerConeColor {
        get => this.get_InnerConeColor()
        set => this.put_InnerConeColor(value)
    }

    /**
     * The linear coefficient in the light's attenuation equation that determines how the light falls off with distance. Animatable.
     * @remarks
     * The 
     *     **SpotLight.LinearAttenuation**
     *    property is part of the attenuation equation which also contains [SpotLight.ConstantAttenuation](spotlight_constantattenuation.md) and [SpotLight.QuadraticAttenuation](spotlight_quadraticattenuation.md):
     * 
     * <img src="images/attenuationequation.png" alt="1/(Constant+Linear*(Distance/100)+Quadratic*(Distance/100)*(Distance/100))" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.linearattenuation
     * @type {Float} 
     */
    LinearAttenuation {
        get => this.get_LinearAttenuation()
        set => this.put_LinearAttenuation(value)
    }

    /**
     * Offset of the light source relative to its [CoordinateSpace](spotlight_coordinatespace.md) Visual. Animatable.
     * @remarks
     * **SpotLight.Offset**
     *    is relative to [SpotLight.CoordinateSpace](spotlight_coordinatespace.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.offset
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The SpotLight’s outer cone angle, expressed as a semi-vertical angle in radians. Animatable.
     * @remarks
     * Light emitted from a spotlight is made up of a bright inner cone and a larger outer cone, with the light intensity diminishing between the two.
     * 
     * 
     *     **OuterConeAngle**
     *    is not bound to 
     *     **InnerConeAngle**
     *    parameters.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.outerconeangle
     * @type {Float} 
     */
    OuterConeAngle {
        get => this.get_OuterConeAngle()
        set => this.put_OuterConeAngle(value)
    }

    /**
     * The semi-vertical angle, in degrees, of the SpotLight's outer cone. Animatable.
     * @remarks
     * Light emitted from a spotlight is made up of a bright inner cone and a larger outer cone, with the light intensity diminishing between the two.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.outerconeangleindegrees
     * @type {Float} 
     */
    OuterConeAngleInDegrees {
        get => this.get_OuterConeAngleInDegrees()
        set => this.put_OuterConeAngleInDegrees(value)
    }

    /**
     * The color of the spotlight's outer cone. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.outerconecolor
     * @type {Color} 
     */
    OuterConeColor {
        get => this.get_OuterConeColor()
        set => this.put_OuterConeColor(value)
    }

    /**
     * The quadratic portion of the attenuation equation that determines how the light falls off with distance. Animatable.
     * @remarks
     * The SpotLight.QuadraticAttenuation property is part of the attenuation equation which also includes SpotLight.LinearAttenuation and SpotLight.ConstantAttenuation:
     * 
     * <img src="images/attenuationequation.png" alt="1/(Constant+Linear*(Distance/100)+Quadratic*(Distance/100)*(Distance/100))" />
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.quadraticattenuation
     * @type {Float} 
     */
    QuadraticAttenuation {
        get => this.get_QuadraticAttenuation()
        set => this.put_QuadraticAttenuation(value)
    }

    /**
     * Gets or sets the intensity of the light in the spotlight's inner cone.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.innerconeintensity
     * @type {Float} 
     */
    InnerConeIntensity {
        get => this.get_InnerConeIntensity()
        set => this.put_InnerConeIntensity(value)
    }

    /**
     * Gets or sets the intensity of the light in the spotlight's outer cone.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.outerconeintensity
     * @type {Float} 
     */
    OuterConeIntensity {
        get => this.get_OuterConeIntensity()
        set => this.put_OuterConeIntensity(value)
    }

    /**
     * Gets or sets the minimum range at which this light is effective.
     * @remarks
     * If the difference between MinAttenuationCutoff and MaxAttenuationCutoff is 0 or negative, the range is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.minattenuationcutoff
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.spotlight.maxattenuationcutoff
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
     * @returns {Float} 
     */
    get_ConstantAttenuation() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_ConstantAttenuation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ConstantAttenuation(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_ConstantAttenuation(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_CoordinateSpace() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_CoordinateSpace()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_CoordinateSpace(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_CoordinateSpace(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Direction() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_Direction()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Direction(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_Direction(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InnerConeAngle() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_InnerConeAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InnerConeAngle(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_InnerConeAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InnerConeAngleInDegrees() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_InnerConeAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InnerConeAngleInDegrees(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_InnerConeAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_InnerConeColor() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_InnerConeColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_InnerConeColor(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_InnerConeColor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LinearAttenuation() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_LinearAttenuation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_LinearAttenuation(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_LinearAttenuation(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_Offset()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterConeAngle() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_OuterConeAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OuterConeAngle(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_OuterConeAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterConeAngleInDegrees() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_OuterConeAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OuterConeAngleInDegrees(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_OuterConeAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_OuterConeColor() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_OuterConeColor()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_OuterConeColor(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_OuterConeColor(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_QuadraticAttenuation() {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.get_QuadraticAttenuation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_QuadraticAttenuation(value) {
        if (!this.HasProp("__ISpotLight")) {
            if ((queryResult := this.QueryInterface(ISpotLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight := ISpotLight(outPtr)
        }

        return this.__ISpotLight.put_QuadraticAttenuation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_InnerConeIntensity() {
        if (!this.HasProp("__ISpotLight2")) {
            if ((queryResult := this.QueryInterface(ISpotLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight2 := ISpotLight2(outPtr)
        }

        return this.__ISpotLight2.get_InnerConeIntensity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_InnerConeIntensity(value) {
        if (!this.HasProp("__ISpotLight2")) {
            if ((queryResult := this.QueryInterface(ISpotLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight2 := ISpotLight2(outPtr)
        }

        return this.__ISpotLight2.put_InnerConeIntensity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OuterConeIntensity() {
        if (!this.HasProp("__ISpotLight2")) {
            if ((queryResult := this.QueryInterface(ISpotLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight2 := ISpotLight2(outPtr)
        }

        return this.__ISpotLight2.get_OuterConeIntensity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_OuterConeIntensity(value) {
        if (!this.HasProp("__ISpotLight2")) {
            if ((queryResult := this.QueryInterface(ISpotLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight2 := ISpotLight2(outPtr)
        }

        return this.__ISpotLight2.put_OuterConeIntensity(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinAttenuationCutoff() {
        if (!this.HasProp("__ISpotLight3")) {
            if ((queryResult := this.QueryInterface(ISpotLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight3 := ISpotLight3(outPtr)
        }

        return this.__ISpotLight3.get_MinAttenuationCutoff()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinAttenuationCutoff(value) {
        if (!this.HasProp("__ISpotLight3")) {
            if ((queryResult := this.QueryInterface(ISpotLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight3 := ISpotLight3(outPtr)
        }

        return this.__ISpotLight3.put_MinAttenuationCutoff(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxAttenuationCutoff() {
        if (!this.HasProp("__ISpotLight3")) {
            if ((queryResult := this.QueryInterface(ISpotLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight3 := ISpotLight3(outPtr)
        }

        return this.__ISpotLight3.get_MaxAttenuationCutoff()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxAttenuationCutoff(value) {
        if (!this.HasProp("__ISpotLight3")) {
            if ((queryResult := this.QueryInterface(ISpotLight3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpotLight3 := ISpotLight3(outPtr)
        }

        return this.__ISpotLight3.put_MaxAttenuationCutoff(value)
    }

;@endregion Instance Methods
}
