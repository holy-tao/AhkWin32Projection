#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILampArrayBitmapEffect.ahk
#Include .\ILampArrayEffect.ahk
#Include .\ILampArrayBitmapEffectFactory.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\LampArrayBitmapEffect.ahk
#Include .\LampArrayBitmapRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Renders a series of images to selected lamp indexes on the device.
 * @remarks
 * Effect captures a series of images, by the caller subscribing to the [BitmapRequested](lamparraybitmapeffect_bitmaprequested.md) event and calling [UpdateBitmap](lamparraybitmaprequestedeventargs_updatebitmap_191710798.md) when triggered. This allows for images created on-the-fly to be supplied to the effect.
 * 
 * Best effort is made to create a 2D composition of requested lamps and scale up/down images.
 * 
 * Before you can play an effect, you must append it to a **LampArrayEffectPlaylist** (see [Append](lamparrayeffectplaylist_append_292269384.md)).
 * 
 * If a [LampArray](../windows.devices.lights/lamparray.md) is bound to a LampArrayBitmapEffect and it disconnects, progress of the effect continues as a no-op.  No exception/error is thrown/returned.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmapeffect
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayBitmapEffect extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayBitmapEffect

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayBitmapEffect.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {LampArray} lampArray_ 
     * @param {Integer} lampIndexes_length 
     * @param {Pointer<Integer>} lampIndexes 
     * @returns {LampArrayBitmapEffect} 
     */
    static CreateInstance(lampArray_, lampIndexes_length, lampIndexes) {
        if (!LampArrayBitmapEffect.HasProp("__ILampArrayBitmapEffectFactory")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayBitmapEffect")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayBitmapEffectFactory.IID)
            LampArrayBitmapEffect.__ILampArrayBitmapEffectFactory := ILampArrayBitmapEffectFactory(factoryPtr)
        }

        return LampArrayBitmapEffect.__ILampArrayBitmapEffectFactory.CreateInstance(lampArray_, lampIndexes_length, lampIndexes)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the duration of the effect.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmapeffect.duration
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
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmapeffect.startdelay
     * @type {TimeSpan} 
     */
    StartDelay {
        get => this.get_StartDelay()
        set => this.put_StartDelay(value)
    }

    /**
     * Gets or sets the interval between the triggering of the [BitmapRequested](lamparraybitmapeffect_bitmaprequested.md) event. The supplied image will be displayed until the event is next triggered.
     * @remarks
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmapeffect.updateinterval
     * @type {TimeSpan} 
     */
    UpdateInterval {
        get => this.get_UpdateInterval()
        set => this.put_UpdateInterval(value)
    }

    /**
     * Gets the most suitable image size for the caller selected lamp indexes that results in minimal scaling/distortion.
     * @remarks
     * Images supplied to [UpdateBitmap](lamparraybitmaprequestedeventargs_updatebitmap_191710798.md) that are not of the suggested size will incur a small performance penalty when resizing internally.
     * 
     * It is possible for this size to change between releases, as the algorithm is refined; even for the same LampArray.
     * 
     * Callers must NOT take a dependency that a certain size is returned for a particular LampArray.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmapeffect.suggestedbitmapsize
     * @type {SIZE} 
     */
    SuggestedBitmapSize {
        get => this.get_SuggestedBitmapSize()
    }

    /**
     * Gets or sets the global precedence (across all playlists) for two effects that modify the same lamp (on the same [LampArray](../windows.devices.lights/lamparray.md)).
     * @remarks
     * Higher zIndex implies higher precedence.
     * 
     * If two effects with the same zIndex operate on the same lamp (via two separate [LampArrayEffectPlaylists](lamparrayeffectplaylist.md)), the behavior is undefined.
     * 
     * After you've appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) an effect to a [LampArrayEffectPlaylist](lamparrayeffectplaylist.md), the value of this property is locked, and you can no longer change it.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparraybitmapeffect.zindex
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * Event triggered by the system to indicate a new image should be supplied to the effect.
     * @remarks
     * - Once a playlist starts the effect, it will immediately trigger the `BitmapRequested` event.
     * - If a playlist pauses the effect, it will temporarily stop further event triggers. Will resume when the playlist is started again.
     * - If a playlist stops the effect, no further event triggers will occur until the playlist starts again.
     * - The event will trigger a final time when the [Duration](lamparraybitmapeffect_duration.md) has expired. This should be used by the caller to set any final state before the effect completes.
     * 
     * Behavior of multiple handlers registered with this event is undefined.
     * @type {TypedEventHandler<LampArrayBitmapEffect, LampArrayBitmapRequestedEventArgs>}
    */
    OnBitmapRequested {
        get {
            if(!this.HasProp("__OnBitmapRequested")){
                this.__OnBitmapRequested := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{24b5818b-448e-53fa-ab4c-663008c5d4cf}"),
                    LampArrayBitmapEffect,
                    LampArrayBitmapRequestedEventArgs
                )
                this.__OnBitmapRequestedToken := this.add_BitmapRequested(this.__OnBitmapRequested.iface)
            }
            return this.__OnBitmapRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBitmapRequestedToken")) {
            this.remove_BitmapRequested(this.__OnBitmapRequestedToken)
            this.__OnBitmapRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.get_Duration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.put_Duration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartDelay() {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.get_StartDelay()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_StartDelay(value) {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.put_StartDelay(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_UpdateInterval() {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.get_UpdateInterval()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_UpdateInterval(value) {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.put_UpdateInterval(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_SuggestedBitmapSize() {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.get_SuggestedBitmapSize()
    }

    /**
     * 
     * @param {TypedEventHandler<LampArrayBitmapEffect, LampArrayBitmapRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BitmapRequested(handler) {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.add_BitmapRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BitmapRequested(token) {
        if (!this.HasProp("__ILampArrayBitmapEffect")) {
            if ((queryResult := this.QueryInterface(ILampArrayBitmapEffect.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayBitmapEffect := ILampArrayBitmapEffect(outPtr)
        }

        return this.__ILampArrayBitmapEffect.remove_BitmapRequested(token)
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
