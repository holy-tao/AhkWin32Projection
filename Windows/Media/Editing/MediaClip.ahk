#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaClip.ahk
#Include .\IMediaClipStatics.ahk
#Include .\IMediaClipStatics2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a single media object.
 * @remarks
 * Add media clips to a composition by adding them to a [MediaComposition](mediacomposition.md) object's [Clips](mediacomposition_clips.md) collection.
 * 
 * For how-to guidance on adding media editing to your app, see [Media compositions and editing](/windows/uwp/audio-video-camera/media-compositions-and-editing).
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class MediaClip extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaClip

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaClip.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a solid color video clip that displays a single color for a specified length of time. Solid color video clips are typically used to create an explicit gap between video segments.
     * @remarks
     * Note that the created clip does not use the alpha component of the specified color.
     * @param {Color} color_ The color to display in the video clip.
     * @param {TimeSpan} originalDuration How long to display the color in the video clip.
     * @returns {MediaClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.createfromcolor
     */
    static CreateFromColor(color_, originalDuration) {
        if (!MediaClip.HasProp("__IMediaClipStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaClip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaClipStatics.IID)
            MediaClip.__IMediaClipStatics := IMediaClipStatics(factoryPtr)
        }

        return MediaClip.__IMediaClipStatics.CreateFromColor(color_, originalDuration)
    }

    /**
     * Creates a video clip from a video file.
     * @param {IStorageFile} file_ A [StorageFile](../windows.storage/storagefile.md) object representing the source video file.
     * @returns {IAsyncOperation<MediaClip>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.createfromfileasync
     */
    static CreateFromFileAsync(file_) {
        if (!MediaClip.HasProp("__IMediaClipStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaClip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaClipStatics.IID)
            MediaClip.__IMediaClipStatics := IMediaClipStatics(factoryPtr)
        }

        return MediaClip.__IMediaClipStatics.CreateFromFileAsync(file_)
    }

    /**
     * Creates a video clip that displays a single image for a specified length of time.
     * @param {IStorageFile} file_ A [StorageFile](../windows.storage/storagefile.md) object representing the source image file.
     * @param {TimeSpan} originalDuration How long to display the image in the video clip.
     * @returns {IAsyncOperation<MediaClip>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.createfromimagefileasync
     */
    static CreateFromImageFileAsync(file_, originalDuration) {
        if (!MediaClip.HasProp("__IMediaClipStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaClip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaClipStatics.IID)
            MediaClip.__IMediaClipStatics := IMediaClipStatics(factoryPtr)
        }

        return MediaClip.__IMediaClipStatics.CreateFromImageFileAsync(file_, originalDuration)
    }

    /**
     * Creates a video clip from a Microsoft Direct3D surface.
     * @param {IDirect3DSurface} surface The Microsoft Direct3D surface.
     * @param {TimeSpan} originalDuration The initial duration of the created video clip.
     * @returns {MediaClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.createfromsurface
     */
    static CreateFromSurface(surface, originalDuration) {
        if (!MediaClip.HasProp("__IMediaClipStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaClip")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaClipStatics2.IID)
            MediaClip.__IMediaClipStatics2 := IMediaClipStatics2(factoryPtr)
        }

        return MediaClip.__IMediaClipStatics2.CreateFromSurface(surface, originalDuration)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The amount of time to trim from the beginning of the media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.trimtimefromstart
     * @type {TimeSpan} 
     */
    TrimTimeFromStart {
        get => this.get_TrimTimeFromStart()
        set => this.put_TrimTimeFromStart(value)
    }

    /**
     * The amount of time to trim from the end of the media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.trimtimefromend
     * @type {TimeSpan} 
     */
    TrimTimeFromEnd {
        get => this.get_TrimTimeFromEnd()
        set => this.put_TrimTimeFromEnd(value)
    }

    /**
     * Original playback time of the media clip, without the effects of [TrimTimeFromStart](mediaclip_trimtimefromstart.md) and [TrimTimeFromEnd](mediaclip_trimtimefromend.md) properties.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.originalduration
     * @type {TimeSpan} 
     */
    OriginalDuration {
        get => this.get_OriginalDuration()
    }

    /**
     * Duration of the media clip with [TrimTimeFromStart](mediaclip_trimtimefromstart.md) and [TrimTimeFromEnd](mediaclip_trimtimefromend.md) applied to playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.trimmedduration
     * @type {TimeSpan} 
     */
    TrimmedDuration {
        get => this.get_TrimmedDuration()
    }

    /**
     * An associative collection for storing custom properties associated with the media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.userdata
     * @type {IMap<HSTRING, HSTRING>} 
     */
    UserData {
        get => this.get_UserData()
    }

    /**
     * The time when the media clip starts playing within a [MediaComposition](mediacomposition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.starttimeincomposition
     * @type {TimeSpan} 
     */
    StartTimeInComposition {
        get => this.get_StartTimeInComposition()
    }

    /**
     * The time when the media clip stops playing within a [MediaComposition](mediacomposition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.endtimeincomposition
     * @type {TimeSpan} 
     */
    EndTimeInComposition {
        get => this.get_EndTimeInComposition()
    }

    /**
     * The list of embedded audio tracks in this media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.embeddedaudiotracks
     * @type {IVectorView<EmbeddedAudioTrack>} 
     */
    EmbeddedAudioTracks {
        get => this.get_EmbeddedAudioTracks()
    }

    /**
     * The index of the audio track within the media clip that is used for playback.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.selectedembeddedaudiotrackindex
     * @type {Integer} 
     */
    SelectedEmbeddedAudioTrackIndex {
        get => this.get_SelectedEmbeddedAudioTrackIndex()
        set => this.put_SelectedEmbeddedAudioTrackIndex(value)
    }

    /**
     * Gets or sets the volume of the media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.volume
     * @type {Float} 
     */
    Volume {
        get => this.get_Volume()
        set => this.put_Volume(value)
    }

    /**
     * Gets the list of audio effect definitions for processing the media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.audioeffectdefinitions
     * @type {IVector<IAudioEffectDefinition>} 
     */
    AudioEffectDefinitions {
        get => this.get_AudioEffectDefinitions()
    }

    /**
     * Gets the list of video effect definitions for processing the media clip.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.videoeffectdefinitions
     * @type {IVector<IVideoEffectDefinition>} 
     */
    VideoEffectDefinitions {
        get => this.get_VideoEffectDefinitions()
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
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_TrimTimeFromStart()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromStart(value) {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.put_TrimTimeFromStart(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimTimeFromEnd() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_TrimTimeFromEnd()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_TrimTimeFromEnd(value) {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.put_TrimTimeFromEnd(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_OriginalDuration() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_OriginalDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TrimmedDuration() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_TrimmedDuration()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_UserData() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_UserData()
    }

    /**
     * Creates a [MediaClip](mediaclip.md) object that is identical to this instance.
     * @returns {MediaClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.clone
     */
    Clone() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.Clone()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_StartTimeInComposition() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_StartTimeInComposition()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_EndTimeInComposition() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_EndTimeInComposition()
    }

    /**
     * 
     * @returns {IVectorView<EmbeddedAudioTrack>} 
     */
    get_EmbeddedAudioTracks() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_EmbeddedAudioTracks()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SelectedEmbeddedAudioTrackIndex() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_SelectedEmbeddedAudioTrackIndex()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SelectedEmbeddedAudioTrackIndex(value) {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.put_SelectedEmbeddedAudioTrackIndex(value)
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Volume(value) {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.put_Volume(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Volume() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_Volume()
    }

    /**
     * Gets the [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md) for the media clip.
     * @returns {VideoEncodingProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediaclip.getvideoencodingproperties
     */
    GetVideoEncodingProperties() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.GetVideoEncodingProperties()
    }

    /**
     * 
     * @returns {IVector<IAudioEffectDefinition>} 
     */
    get_AudioEffectDefinitions() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_AudioEffectDefinitions()
    }

    /**
     * 
     * @returns {IVector<IVideoEffectDefinition>} 
     */
    get_VideoEffectDefinitions() {
        if (!this.HasProp("__IMediaClip")) {
            if ((queryResult := this.QueryInterface(IMediaClip.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaClip := IMediaClip(outPtr)
        }

        return this.__IMediaClip.get_VideoEffectDefinitions()
    }

;@endregion Instance Methods
}
