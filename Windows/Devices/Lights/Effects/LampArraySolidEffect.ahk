#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArraySolidEffect.ahk
#Include .\ILampArrayEffect.ahk
#Include .\ILampArraySolidEffectFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Displays a solid/static color for a specific duration.
 * @remarks
 * Before you can play an effect, you must append it to a **LampArrayEffectPlaylist** (see [Append](lamparrayeffectplaylist_append_292269384.md)).
 * 
 * All lamps within the effect behave identically, subject to constraints of the lamp indexes (for example, color channels). Best effort will always be done to accommodate lamp index constraints.
 * 
 * If a [LampArray](../windows.devices.lights/lamparray.md) is bound to a LampArraySolidEffect and it disconnects, progress of the effect continues as a no-op. No exception/error is thrown/returned.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraysolideffect
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArraySolidEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArraySolidEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArraySolidEffect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {LampArray} lampArray_ 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {LampArraySolidEffect} 
     */
    static CreateInstance(lampArray_, lampIndexes_length, lampIndexes) {
        if (!LampArraySolidEffect.HasProp("__ILampArraySolidEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArraySolidEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArraySolidEffectFactory.IID)
            LampArraySolidEffect.__ILampArraySolidEffectFactory := ILampArraySolidEffectFactory(factoryPtr)
        }

        return LampArraySolidEffect.__ILampArraySolidEffectFactory.CreateInstance(lampArray_, lampIndexes_length, lampIndexes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the solid color of the effect.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraysolideffect.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets or sets the duration of the effect; [StartDelay](lamparraysolideffect_startdelay.md) is not included.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraysolideffect.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets the duration to delay before starting the effect.
     * @remarks
     * If within an [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), delay will be evaluated every time playlist repeats.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraysolideffect.startdelay
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraysolideffect.completionbehavior
     * @type {Integer} 
     */
    CompletionBehavior {
        get => this.get_CompletionBehavior()
        set => this.put_CompletionBehavior(value)
    }

    /**
     * Gets or sets the global precedence (across all playlists) for two effects that modify the same lamp (on the same [LampArray](../windows.devices.lights/lamparray.md)).
     * @remarks
     * Higher zIndex implies higher precedence.
     * 
     * If two effects with the same zIndex operate on the same lamp (via two separate [LampArrayEffectPlaylists](lamparrayeffectplaylist.md)), the behavior is undefined.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraysolideffect.zindex
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
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.put_Color(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.put_Duration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartDelay() {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.get_StartDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartDelay(value) {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.put_StartDelay(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompletionBehavior() {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.get_CompletionBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompletionBehavior(value) {
        if (!this.HasProp("__ILampArraySolidEffect")) {
            if ((queryResult := this.QueryInterface(ILampArraySolidEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArraySolidEffect := ILampArraySolidEffect(outPtr)
        }

        return this.__ILampArraySolidEffect.put_CompletionBehavior(value)
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
