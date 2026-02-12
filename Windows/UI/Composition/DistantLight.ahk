#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionLight.ahk
#Include .\IDistantLight.ahk
#Include .\IDistantLight2.ahk
#Include ..\..\..\Guid.ahk

/**
 * An infinitely large distant light source that emits light in a single direction. For example, a distant light could be used to represent sunlight.
 * @remarks
 * **DistantLight**s and [SpotLight](spotlight.md)s support direction.
 * 
 * DistantLight is one of the four light types derived from [CompositionLight](compositionlight.md).
 * 
 * | Light | Description |
 * |---|---|
 * | [AmbientLight](ambientlight.md) | A light source that emits non directional light that appears to have been reflected by everything in the scene. |
 * | DistantLight | An infinitely large distant light source that emits light in a single direction. |
 * | [PointLight](pointlight.md) | A point source of light that emits light in all directions. |
 * | [SpotLight](spotlight.md) | A light source that emits inner and outer cones of light. |
 * 
 * > [!NOTE]
 * > A Visual cannot be targeted by more than two non-ambient lights (PointLight, SpotLight or DistantLight).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.distantlight
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class DistantLight extends CompositionLight {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDistantLight

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDistantLight.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Color of the emitted DistantLight.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.distantlight.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * The Visual used to determine the light’s direction. The light's 
     *     **Direction**
     *    property is relative to this Visual’s coordinate space.
     * 
     * 
     *     **CoordinateSpace**
     *    is a required property. If 
     *     **CoordinateSpace**
     *    is not set, the [DistantLight](distantlight.md) will not render.
     * @remarks
     * DistantLight.Direction is relative to DistantLight.CoordinateSpace. Every Visual has an implicit 3D coordinate space, defined in this way:
     * 
     * <img src="images/coordinatespace.png" alt="X-axis runs from the left edge to the right edge of the visual.  Y-axis runs from the top of the visual to the bottom.  Z-axis is perpandicular to the visual." />
     * 
     * X direction is from left to right. Y direction is from top to bottom. Z direction is point out of the plane. The original point of this coordinate is the upper-left corner of the visual, and the unit is DIP. A light’s offset and direction are defined in this coordinate space.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.distantlight.coordinatespace
     * @type {Visual} 
     */
    CoordinateSpace {
        get => this.get_CoordinateSpace()
        set => this.put_CoordinateSpace(value)
    }

    /**
     * The direction in which the light is pointing, specified relative to its [CoordinateSpace](distantlight_coordinatespace.md) Visual.
     * @remarks
     * **DistantLight.Direction**
     *    is relative to [DistantLight.CoordinateSpace](distantlight_coordinatespace.md)
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.distantlight.direction
     * @type {Vector3} 
     */
    Direction {
        get => this.get_Direction()
        set => this.put_Direction(value)
    }

    /**
     * Gets or sets the intensity of the light.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.distantlight.intensity
     * @type {Float} 
     */
    Intensity {
        get => this.get_Intensity()
        set => this.put_Intensity(value)
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
        if (!this.HasProp("__IDistantLight")) {
            if ((queryResult := this.QueryInterface(IDistantLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight := IDistantLight(outPtr)
        }

        return this.__IDistantLight.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IDistantLight")) {
            if ((queryResult := this.QueryInterface(IDistantLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight := IDistantLight(outPtr)
        }

        return this.__IDistantLight.put_Color(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_CoordinateSpace() {
        if (!this.HasProp("__IDistantLight")) {
            if ((queryResult := this.QueryInterface(IDistantLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight := IDistantLight(outPtr)
        }

        return this.__IDistantLight.get_CoordinateSpace()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_CoordinateSpace(value) {
        if (!this.HasProp("__IDistantLight")) {
            if ((queryResult := this.QueryInterface(IDistantLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight := IDistantLight(outPtr)
        }

        return this.__IDistantLight.put_CoordinateSpace(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Direction() {
        if (!this.HasProp("__IDistantLight")) {
            if ((queryResult := this.QueryInterface(IDistantLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight := IDistantLight(outPtr)
        }

        return this.__IDistantLight.get_Direction()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Direction(value) {
        if (!this.HasProp("__IDistantLight")) {
            if ((queryResult := this.QueryInterface(IDistantLight.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight := IDistantLight(outPtr)
        }

        return this.__IDistantLight.put_Direction(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Intensity() {
        if (!this.HasProp("__IDistantLight2")) {
            if ((queryResult := this.QueryInterface(IDistantLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight2 := IDistantLight2(outPtr)
        }

        return this.__IDistantLight2.get_Intensity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Intensity(value) {
        if (!this.HasProp("__IDistantLight2")) {
            if ((queryResult := this.QueryInterface(IDistantLight2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDistantLight2 := IDistantLight2(outPtr)
        }

        return this.__IDistantLight2.put_Intensity(value)
    }

;@endregion Instance Methods
}
