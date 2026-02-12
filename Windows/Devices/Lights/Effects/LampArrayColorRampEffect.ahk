#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArrayColorRampEffect.ahk
#Include .\ILampArrayEffect.ahk
#Include .\ILampArrayColorRampEffectFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Transitions lamp/s from their existing color (whatever last set to), to the prescribed color.
 * @remarks
 * Transition is via a simple linear curve over the prescribed [RampDuration](lamparraycolorrampeffect_rampduration.md).
 * 
 * Behavior across lamps is not guaranteed to be identical as lamp/s can start from different colors.
 * 
 * Before you can play an effect, you must append it to a **LampArrayEffectPlaylist** (see [Append](lamparrayeffectplaylist_append_292269384.md)).
 * 
 * If a [LampArray](../windows.devices.lights/lamparray.md) is bound to a LampArrayColorRampEffect and it disconnects, progress of the effect continues as a no-op. No exception/error is thrown/returned.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycolorrampeffect
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayColorRampEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayColorRampEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayColorRampEffect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {LampArray} lampArray_ 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {LampArrayColorRampEffect} 
     */
    static CreateInstance(lampArray_, lampIndexes_length, lampIndexes) {
        if (!LampArrayColorRampEffect.HasProp("__ILampArrayColorRampEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayColorRampEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayColorRampEffectFactory.IID)
            LampArrayColorRampEffect.__ILampArrayColorRampEffectFactory := ILampArrayColorRampEffectFactory(factoryPtr)
        }

        return LampArrayColorRampEffect.__ILampArrayColorRampEffectFactory.CreateInstance(lampArray_, lampIndexes_length, lampIndexes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the color of peak intensity for the effect.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycolorrampeffect.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the time spent ramping-up to peak intensity from the previously set color.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycolorrampeffect.rampduration
     * @type {TimeSpan} 
     */
    RampDuration {
        get => this.get_RampDuration()
        set => this.put_RampDuration(value)
    }

    /**
     * Gets or sets the duration to delay before starting the effect.
     * @remarks
     * If within an [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), delay will be evaluated every time playlist repeats.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycolorrampeffect.startdelay
     * @type {TimeSpan} 
     */
    StartDelay {
        get => this.get_StartDelay()
        set => this.put_StartDelay(value)
    }

    /**
     * Gets or sets the behavior when effect completes.
     * @remarks
     * If within an [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), behavior will be applied every time playlist repeats.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycolorrampeffect.completionbehavior
     * @type {Integer} 
     */
    CompletionBehavior {
        get => this.get_CompletionBehavior()
        set => this.put_CompletionBehavior(value)
    }

    /**
     * The global precedence for two effects that modify the same lamp.
     * @remarks
     * Higher zIndex implies higher precedence.
     * 
     * If two effects with the same zIndex operate on the same lamp (via two separate [LampArrayEffectPlaylists](lamparrayeffectplaylist.md)), the behavior is undefined.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycolorrampeffect.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
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
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.put_Color(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RampDuration() {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.get_RampDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RampDuration(value) {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.put_RampDuration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartDelay() {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.get_StartDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartDelay(value) {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.put_StartDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompletionBehavior() {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.get_CompletionBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompletionBehavior(value) {
        if (!this.HasProp("__ILampArrayColorRampEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayColorRampEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayColorRampEffect := ILampArrayColorRampEffect(outPtr)
        }

        return this.__ILampArrayColorRampEffect.put_CompletionBehavior(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        if (!this.HasProp("__ILampArrayEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffect := ILampArrayEffect(outPtr)
        }

        return this.__ILampArrayEffect.get_ZIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ZIndex(value) {
        if (!this.HasProp("__ILampArrayEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffect := ILampArrayEffect(outPtr)
        }

        return this.__ILampArrayEffect.put_ZIndex(value)
    }

;@endregion Instance Methods
}
