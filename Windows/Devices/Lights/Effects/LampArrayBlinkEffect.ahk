#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArrayBlinkEffect.ahk
#Include .\ILampArrayEffect.ahk
#Include .\ILampArrayBlinkEffectFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Blinks lamp/s a color for a specific duration.  Timing of attack/sustain/decay phases can be defined.
 * @remarks
 * Always starts from off/[Black](../windows.ui/colors_black.md), attacks to a defined color, sustains at peak color intensity, then decays back to off/[Black](../windows.ui/colors_black.md)
 * 
 * Will always set the state of lamp/s to off/[Black](../windows.ui/colors_black.md) when effect completes, regardless of progress.
 * 
 * Before you can play an effect, you must append it to a **LampArrayEffectPlaylist** (see [Append](lamparrayeffectplaylist_append_292269384.md)).
 * 
 * All lamps within the effect behave identically, subject to contraints of the lamp indexes (for example, color channels). Best effort will always be done to accommodate lamp index constraints.
 * 
 * If a [LampArray](../windows.devices.lights/lamparray.md) is bound to a LampArrayBlinkEffect and it disconnects, progress of the effect continues as a no-op. No exception/error is thrown/returned.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayBlinkEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayBlinkEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayBlinkEffect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {LampArray} lampArray_ 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {LampArrayBlinkEffect} 
     */
    static CreateInstance(lampArray_, lampIndexes_length, lampIndexes) {
        if (!LampArrayBlinkEffect.HasProp("__ILampArrayBlinkEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayBlinkEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayBlinkEffectFactory.IID)
            LampArrayBlinkEffect.__ILampArrayBlinkEffectFactory := ILampArrayBlinkEffectFactory(factoryPtr)
        }

        return LampArrayBlinkEffect.__ILampArrayBlinkEffectFactory.CreateInstance(lampArray_, lampIndexes_length, lampIndexes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the color of peak intensity for the effect. Duration color is visible defined by [SustainDuration](lamparrayblinkeffect_sustainduration.md).
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the time spent attacking/ramping-up from off/[Black](../windows.ui/colors_black.md) to [peak intensity](lamparrayblinkeffect_color.md).
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.attackduration
     * @type {TimeSpan} 
     */
    AttackDuration {
        get => this.get_AttackDuration()
        set => this.put_AttackDuration(value)
    }

    /**
     * Gets or sets the time spent displaying peak intensity for the effect.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.sustainduration
     * @type {TimeSpan} 
     */
    SustainDuration {
        get => this.get_SustainDuration()
        set => this.put_SustainDuration(value)
    }

    /**
     * Gets or sets the time spent decaying/ramping-down from peak intensity to off/[Black](../windows.ui/colors_black.md).
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.decayduration
     * @type {TimeSpan} 
     */
    DecayDuration {
        get => this.get_DecayDuration()
        set => this.put_DecayDuration(value)
    }

    /**
     * Gets or sets the delay between effect repetitions.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.repetitiondelay
     * @type {TimeSpan} 
     */
    RepetitionDelay {
        get => this.get_RepetitionDelay()
        set => this.put_RepetitionDelay(value)
    }

    /**
     * Gets or sets the duration to delay before starting the effect.
     * @remarks
     * If within an [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), delay will be evaluated every time playlist repeats.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.startdelay
     * @type {TimeSpan} 
     */
    StartDelay {
        get => this.get_StartDelay()
        set => this.put_StartDelay(value)
    }

    /**
     * Number of occurrences this effect will play.
     * @remarks
     * If [RepetitionMode](lamparrayblinkeffect_repetitionmode.md) is Forever, this is ignored.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.occurrences
     * @type {Integer} 
     */
    Occurrences {
        get => this.get_Occurrences()
        set => this.put_Occurrences(value)
    }

    /**
     * Gets or sets the repetition behavior of the effect.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.repetitionmode
     * @type {Integer} 
     */
    RepetitionMode {
        get => this.get_RepetitionMode()
        set => this.put_RepetitionMode(value)
    }

    /**
     * Gets or sets the global precedence (across all playlists) for two effects that modify the same lamp (on the same [LampArray](../windows.devices.lights/lamparray.md)).
     * @remarks
     * Higher zIndex implies higher precedence.
     * 
     * If two effects with the same zIndex operate on the same lamp (via two separate [LampArrayEffectPlaylists](lamparrayeffectplaylist.md)), the behaviour is undefined.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayblinkeffect.zindex
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
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_Color(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AttackDuration() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_AttackDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_AttackDuration(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_AttackDuration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SustainDuration() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_SustainDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_SustainDuration(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_SustainDuration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DecayDuration() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_DecayDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DecayDuration(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_DecayDuration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_RepetitionDelay() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_RepetitionDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_RepetitionDelay(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_RepetitionDelay(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartDelay() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_StartDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartDelay(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_StartDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Occurrences() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_Occurrences()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Occurrences(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_Occurrences(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RepetitionMode() {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.get_RepetitionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RepetitionMode(value) {
        if (!this.HasProp("__ILampArrayBlinkEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBlinkEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBlinkEffect := ILampArrayBlinkEffect(outPtr)
        }

        return this.__ILampArrayBlinkEffect.put_RepetitionMode(value)
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
