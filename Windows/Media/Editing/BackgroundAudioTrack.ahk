#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundAudioTrack.ahk
#Include .\IBackgroundAudioTrackStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single audio track for accompanying a video clip.
 * @remarks
 * Add background audio tracks to a composition by adding them to a [MediaComposition](mediacomposition.md) object's [BackgroundAudioTracks](mediacomposition_backgroundaudiotracks.md) collection.
 * 
 * For how-to guidance on adding media editing to your app, see [Media compositions and editing](/windows/uwp/audio-video-camera/media-compositions-and-editing).
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class BackgroundAudioTrack extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBackgroundAudioTrack

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBackgroundAudioTrack.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a background audio track object with audio content copied from an embedded audio track object.
     * @param {EmbeddedAudioTrack} embeddedAudioTrack_ An embedded audio track to use as the source audio for the background audio track.
     * @returns {BackgroundAudioTrack} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.createfromembeddedaudiotrack
     */
    static CreateFromEmbeddedAudioTrack(embeddedAudioTrack_) {
        if (!BackgroundAudioTrack.HasProp("__IBackgroundAudioTrackStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.BackgroundAudioTrack")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundAudioTrackStatics.IID)
            BackgroundAudioTrack.__IBackgroundAudioTrackStatics := IBackgroundAudioTrackStatics(factoryPtr)
        }

        return BackgroundAudioTrack.__IBackgroundAudioTrackStatics.CreateFromEmbeddedAudioTrack(embeddedAudioTrack_)
    }

    /**
     * Creates a background audio track from an audio file.
     * @param {IStorageFile} file_ A [StorageFile](../windows.storage/storagefile.md) object representing the source audio file.
     * @returns {IAsyncOperation<BackgroundAudioTrack>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.createfromfileasync
     */
    static CreateFromFileAsync(file_) {
        if (!BackgroundAudioTrack.HasProp("__IBackgroundAudioTrackStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.BackgroundAudioTrack")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundAudioTrackStatics.IID)
            BackgroundAudioTrack.__IBackgroundAudioTrackStatics := IBackgroundAudioTrackStatics(factoryPtr)
        }

        return BackgroundAudioTrack.__IBackgroundAudioTrackStatics.CreateFromFileAsync(file_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The amount of time to trim from the beginning of the background audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.trimtimefromstart
     * @type {TimeSpan} 
     */
    TrimTimeFromStart {
        get => this.get_TrimTimeFromStart()
        set => this.put_TrimTimeFromStart(value)
    }

    /**
     * The amount of time to trim from the end of the background audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.trimtimefromend
     * @type {TimeSpan} 
     */
    TrimTimeFromEnd {
        get => this.get_TrimTimeFromEnd()
        set => this.put_TrimTimeFromEnd(value)
    }

    /**
     * Original playback time of the background audio track, without the effects of the [TrimTimeFromStart](backgroundaudiotrack_trimtimefromstart.md) and [TrimTimeFromEnd](backgroundaudiotrack_trimtimefromend.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.originalduration
     * @type {TimeSpan} 
     */
    OriginalDuration {
        get => this.get_OriginalDuration()
    }

    /**
     * Duration of the background audio track with [TrimTimeFromStart](backgroundaudiotrack_trimtimefromstart.md) and [TrimTimeFromEnd](backgroundaudiotrack_trimtimefromend.md) applied to playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.trimmedduration
     * @type {TimeSpan} 
     */
    TrimmedDuration {
        get => this.get_TrimmedDuration()
    }

    /**
     * An associative collection for storing custom properties associated with the background audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.userdata
     * @type {IMap<HSTRING, HSTRING>} 
     */
    UserData {
        get => this.get_UserData()
    }

    /**
     * Specifies how long to wait before starting background audio playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.delay
     * @type {TimeSpan} 
     */
    Delay {
        get => this.get_Delay()
        set => this.put_Delay(value)
    }

    /**
     * Gets or sets the volume of the background audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.volume
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * Gets the list of audio effect definitions for processing the background audio track.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.audioeffectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    AudioEffectDefinitions {
        get => this.get_AudioEffectDefinitions()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromStart() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_TrimTimeFromStart()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromStart(value) {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.put_TrimTimeFromStart(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromEnd() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_TrimTimeFromEnd()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromEnd(value) {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.put_TrimTimeFromEnd(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_OriginalDuration() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_OriginalDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimmedDuration() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_TrimmedDuration()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_UserData() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_UserData()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Delay(value) {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.put_Delay(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Delay() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_Delay()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.put_Volume(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_Volume()
    }

    /**
     * Creates a [BackgroundAudioTrack](backgroundaudiotrack.md) object that is identical to this instance.
     * @returns {BackgroundAudioTrack} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.clone
     */
    Clone() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.Clone()
    }

    /**
     * Gets the [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md) for the background audio track.
     * @returns {AudioEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.backgroundaudiotrack.getaudioencodingproperties
     */
    GetAudioEncodingProperties() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.GetAudioEncodingProperties()
    }

    /**
     * 
     * @returns {IVector<IAudioEffectDefinition>} 
     */
    get_AudioEffectDefinitions() {
        if (!this.HasProp("__IBackgroundAudioTrack")) {
            if ((queryResult := this.QueryInterface(IBackgroundAudioTrack.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBackgroundAudioTrack := IBackgroundAudioTrack(outPtr)
        }

        return this.__IBackgroundAudioTrack.get_AudioEffectDefinitions()
    }

;@endregion Instance Methods
}
