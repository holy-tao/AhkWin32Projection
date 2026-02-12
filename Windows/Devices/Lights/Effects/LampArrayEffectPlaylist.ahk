#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\ILampArrayEffect.ahk
#Include .\ILampArrayEffectPlaylist.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include .\ILampArrayEffectPlaylistStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Used to either chain multiple effects together, or to start effects simultaneously.
 * @remarks
 * Before you can play an effect, you must append it to a **LampArrayEffectPlaylist** (see [Append](lamparrayeffectplaylist_append_292269384.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist
 * @namespace Windows.Devices.Lights.Effects
 * @version WindowsRuntime 1.4
 */
class LampArrayEffectPlaylist extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILampArrayEffectPlaylist

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILampArrayEffectPlaylist.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Guarantees that all playlists will start at the same time.
     * @remarks
     * This removes the small lag time that occurs if called on each [LampArrayEffectPlaylist](lamparrayeffectplaylist.md) from within a for-loop.
     * @param {IIterable<LampArrayEffectPlaylist>} value Playlists to start simultaneously.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.startall
     */
    static StartAll(value) {
        if (!LampArrayEffectPlaylist.HasProp("__ILampArrayEffectPlaylistStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayEffectPlaylistStatics.IID)
            LampArrayEffectPlaylist.__ILampArrayEffectPlaylistStatics := ILampArrayEffectPlaylistStatics(factoryPtr)
        }

        return LampArrayEffectPlaylist.__ILampArrayEffectPlaylistStatics.StartAll(value)
    }

    /**
     * Guarantees that all playlists will stop at the same time.
     * @remarks
     * This removes the small lag time that occurs if called on each [LampArrayEffectPlaylist](lamparrayeffectplaylist.md) from within a for-loop.
     * @param {IIterable<LampArrayEffectPlaylist>} value Playlists to stop simultaneously.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.stopall
     */
    static StopAll(value) {
        if (!LampArrayEffectPlaylist.HasProp("__ILampArrayEffectPlaylistStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayEffectPlaylistStatics.IID)
            LampArrayEffectPlaylist.__ILampArrayEffectPlaylistStatics := ILampArrayEffectPlaylistStatics(factoryPtr)
        }

        return LampArrayEffectPlaylist.__ILampArrayEffectPlaylistStatics.StopAll(value)
    }

    /**
     * Guarantees that all playlists will pause at the same time.
     * @remarks
     * This removes the small time lag that occurs if called on each [LampArrayEffectPlaylist](lamparrayeffectplaylist.md) from within a for-loop.
     * @param {IIterable<LampArrayEffectPlaylist>} value Playlists to pause simultaneously.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.pauseall
     */
    static PauseAll(value) {
        if (!LampArrayEffectPlaylist.HasProp("__ILampArrayEffectPlaylistStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILampArrayEffectPlaylistStatics.IID)
            LampArrayEffectPlaylist.__ILampArrayEffectPlaylistStatics := ILampArrayEffectPlaylistStatics(factoryPtr)
        }

        return LampArrayEffectPlaylist.__ILampArrayEffectPlaylistStatics.PauseAll(value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the starting behavior for the effects.
     * @remarks
     * After a playlist has started, the value is locked and it's no longer possible to set the value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.effectstartmode
     * @type {Integer} 
     */
    EffectStartMode {
        get => this.get_EffectStartMode()
        set => this.put_EffectStartMode(value)
    }

    /**
     * Gets or sets the number of occurrences that this playlist will play.
     * @remarks
     * If [RepetitionMode](lamparrayeffectplaylist_repetitionmode.md) is Forever, this is ignored.
     * 
     * After playlist has started, the value is locked and is no longer possible to set the value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.occurrences
     * @type {Integer} 
     */
    Occurrences {
        get => this.get_Occurrences()
        set => this.put_Occurrences(value)
    }

    /**
     * Gets or sets the repetition behavior for playlist.
     * @remarks
     * After playlist has started, the value is locked and it's no longer possible to set the value.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.repetitionmode
     * @type {Integer} 
     */
    RepetitionMode {
        get => this.get_RepetitionMode()
        set => this.put_RepetitionMode(value)
    }

    /**
     * Gets the size of (the number of elements in) the playlist.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of a playlist.
     * @remarks
     * Before you can play an effect, you must append it to a **LampArrayEffectPlaylist** (see [Append](lamparrayeffectplaylist_append_292269384.md)).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Lights.Effects.LampArrayEffectPlaylist")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Appends the effect to the end of the playlist.
     * @remarks
     * Once an effect has been appended to a playlist, it cannot be appended to another. Instead, you must create a new instance of the effect.
     * 
     * After a playlist has started, its state is locked, and you can't append further effects to it.
     * @param {ILampArrayEffect} effect_ Effect to append to the playlist.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.append
     */
    Append(effect_) {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.Append(effect_)
    }

    /**
     * Overrides the zIndex for all contained effects.
     * @remarks
     * Effects added after OverrideZIndex is called will still be overridden.
     * 
     * After the playlist has started, all zIndexes are locked and it's not possible to override further.
     * @param {Integer} zIndex The overriding zIndex.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.overridezindex
     */
    OverrideZIndex(zIndex) {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.OverrideZIndex(zIndex)
    }

    /**
     * Starts this playlist from the beginning, unless it was previously paused, which will then resuming playing from the paused position.
     * @remarks
     * Effects are played in the order appended (see [Append](lamparrayeffectplaylist_append_292269384.md)) to the playlist.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.start
     */
    Start() {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.Start()
    }

    /**
     * Stops playing this playlist.
     * @remarks
     * No state is persisted on the device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.stop
     */
    Stop() {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.Stop()
    }

    /**
     * Pauses the playlist, and persists the last state set by the internally playing effect.
     * @remarks
     * Can be resumed by called [Start](lamparrayeffectplaylist_start_1587696324.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.pause
     */
    Pause() {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.Pause()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EffectStartMode() {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.get_EffectStartMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_EffectStartMode(value) {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.put_EffectStartMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Occurrences() {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.get_Occurrences()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Occurrences(value) {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.put_Occurrences(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RepetitionMode() {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.get_RepetitionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RepetitionMode(value) {
        if (!this.HasProp("__ILampArrayEffectPlaylist")) {
            if ((queryResult := this.QueryInterface(ILampArrayEffectPlaylist.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILampArrayEffectPlaylist := ILampArrayEffectPlaylist(outPtr)
        }

        return this.__ILampArrayEffectPlaylist.put_RepetitionMode(value)
    }

    /**
     * Retrieves the lamp array effect at the specified index within a playlist.
     * @param {Integer} index The zero-based index of the lamp array effect to retrieve.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{97159586-9fb0-56d4-9df4-8c36ea15100e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ILampArrayEffect, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{97159586-9fb0-56d4-9df4-8c36ea15100e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ILampArrayEffect, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Retrieves the index, within a playlist, of the specified lamp array effect.
     * @param {Generic} value An [ILampArrayEffect](ilamparrayeffect.md) representing the lamp array effect whose index to retrieve.
     * @param {Pointer<UInt32>} index The index of the effect within the playlist, as an out parameter. If the *value* is found, then the method will update *index* with the zero-based index of the effect within the playlist.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{97159586-9fb0-56d4-9df4-8c36ea15100e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ILampArrayEffect, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Retrieves a range of lamp array effects, beginning at the specified index within a playlist.
     * @param {Integer} startIndex The zero-based index of the first lamp array effect to retrieve.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array of [ILampArrayEffect](ilamparrayeffect.md), which the method will update with the requested effects.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{97159586-9fb0-56d4-9df4-8c36ea15100e}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(ILampArrayEffect, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Retrieves an iterator representing the first item in a lamp array effect playlist.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.lights.effects.lamparrayeffectplaylist.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{3f108d37-6679-5590-aed2-033362fbf413}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(ILampArrayEffect, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
