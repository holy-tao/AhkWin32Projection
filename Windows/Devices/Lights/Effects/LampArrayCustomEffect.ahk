#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArrayCustomEffect.ahk
#Include .\ILampArrayEffect.ahk
#Include .\ILampArrayCustomEffectFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\LampArrayCustomEffect.ahk
#Include .\LampArrayUpdateRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * This effect provides an entry-point for developer-defined custom effects into the effect framework; allowing it to be included and scheduled within playlists.
 * @remarks
 * Similar to [BitmapEffect](lamparraybitmapeffect.md), a developer specifies the subset of lamp indexes to affect and then subscribes to the [UpdateRequested](lamparraycustomeffect_updaterequested.md) event to modify lamp state at a recurring interval.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycustomeffect
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayCustomEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayCustomEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayCustomEffect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {LampArray} lampArray_ 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {LampArrayCustomEffect} 
     */
    static CreateInstance(lampArray_, lampIndexes_length, lampIndexes) {
        if (!LampArrayCustomEffect.HasProp("__ILampArrayCustomEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayCustomEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayCustomEffectFactory.IID)
            LampArrayCustomEffect.__ILampArrayCustomEffectFactory := ILampArrayCustomEffectFactory(factoryPtr)
        }

        return LampArrayCustomEffect.__ILampArrayCustomEffectFactory.CreateInstance(lampArray_, lampIndexes_length, lampIndexes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the duration of the effect.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycustomeffect.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets the interval between the triggering of the [UpdateRequested](lamparraycustomeffect_updaterequested.md) event.  The supplied image will be displayed until the event is next triggered.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycustomeffect.updateinterval
     * @type {TimeSpan} 
     */
    UpdateInterval {
        get => this.get_UpdateInterval()
        set => this.put_UpdateInterval(value)
    }

    /**
     * The global precedence for two effects that modify the same lamp.
     * @remarks
     * Higher zIndex implies higher precedence.
     * 
     * If two effects with the same zIndex operate on the same lamp (via two separate [LampArrayEffectPlaylists](lamparrayeffectplaylist.md)), the behavior is undefined.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraycustomeffect.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * Event triggered by the system to indicate that lamp state should be modified.
     * @remarks
     * - Once a playlist starts the effect it will immediately trigger the UpdateRequested event.
     * - If a playlist pauses the effect, it will temporarily stop further event triggers. Will resume when the playlist is started again.
     * - If a playlist stops the effect, no further event triggers will occur until the playlist starts again.
     * - The event will trigger a final time when the [Duration](lamparraycustomeffect_duration.md) has expired. This should be used by the caller to set any final state before the effect completes.
     * 
     * Behavior of multiple handlers registered with this event is undefined.
     * @type {TypedEventHandler<LampArrayCustomEffect, LampArrayUpdateRequestedEventArgs>}
    */
    OnUpdateRequested {
        get {
            if(!this.HasProp("__OnUpdateRequested")){
                this.__OnUpdateRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{7d91af6e-ba44-5a0f-bc64-3901fd33661c}"),
                    LampArrayCustomEffect,
                    LampArrayUpdateRequestedEventArgs
                )
                this.__OnUpdateRequestedToken := this.add_UpdateRequested(this.__OnUpdateRequested.iface)
            }
            return this.__OnUpdateRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnUpdateRequestedToken")) {
            this.remove_UpdateRequested(this.__OnUpdateRequestedToken)
            this.__OnUpdateRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__ILampArrayCustomEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayCustomEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayCustomEffect := ILampArrayCustomEffect(outPtr)
        }

        return this.__ILampArrayCustomEffect.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__ILampArrayCustomEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayCustomEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayCustomEffect := ILampArrayCustomEffect(outPtr)
        }

        return this.__ILampArrayCustomEffect.put_Duration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UpdateInterval() {
        if (!this.HasProp("__ILampArrayCustomEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayCustomEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayCustomEffect := ILampArrayCustomEffect(outPtr)
        }

        return this.__ILampArrayCustomEffect.get_UpdateInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_UpdateInterval(value) {
        if (!this.HasProp("__ILampArrayCustomEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayCustomEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayCustomEffect := ILampArrayCustomEffect(outPtr)
        }

        return this.__ILampArrayCustomEffect.put_UpdateInterval(value)
    }

    /**
     * 
     * @param {TypedEventHandler<LampArrayCustomEffect, LampArrayUpdateRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UpdateRequested(handler) {
        if (!this.HasProp("__ILampArrayCustomEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayCustomEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayCustomEffect := ILampArrayCustomEffect(outPtr)
        }

        return this.__ILampArrayCustomEffect.add_UpdateRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UpdateRequested(token) {
        if (!this.HasProp("__ILampArrayCustomEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayCustomEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayCustomEffect := ILampArrayCustomEffect(outPtr)
        }

        return this.__ILampArrayCustomEffect.remove_UpdateRequested(token)
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
