#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaComposition.ahk
#Include .\IMediaComposition2.ahk
#Include .\IMediaCompositionStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a collection of media clips and background audio tracks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition
 * @namespace Windows.Media.Editing
 * @version WindowsRuntime 1.4
 */
class MediaComposition extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaComposition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaComposition.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Asynchronously loads a [MediaComposition](mediacomposition.md) from a [StorageFile](../windows.storage/storagefile.md).
     * @remarks
     * This method allows you to load a composition from an XML file you saved with a previous call to [SaveAsync](mediacomposition_saveasync_389603876.md). Once you have loaded the composition, you can make changes to the composition and either save it again or render it to a video file by calling [RenderToFileAsync](/uwp/api/windows.media.editing.mediacomposition.rendertofileasync).
     * @param {StorageFile} file_ The file from which to load the [MediaComposition](mediacomposition.md).
     * @returns {IAsyncOperation<MediaComposition>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.loadasync
     */
    static LoadAsync(file_) {
        if (!MediaComposition.HasProp("__IMediaCompositionStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaComposition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaCompositionStatics.IID)
            MediaComposition.__IMediaCompositionStatics := IMediaCompositionStatics(factoryPtr)
        }

        return MediaComposition.__IMediaCompositionStatics.LoadAsync(file_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The total playback time of the media composition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * A collection of media clips for playback in the media composition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.clips
     * @type {IVector<MediaClip>} 
     */
    Clips {
        get => this.get_Clips()
    }

    /**
     * A collection of background audio tracks for playback in the media composition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.backgroundaudiotracks
     * @type {IVector<BackgroundAudioTrack>} 
     */
    BackgroundAudioTracks {
        get => this.get_BackgroundAudioTracks()
    }

    /**
     * An associative collection for storing custom properties associated with the media composition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.userdata
     * @type {IMap<HSTRING, HSTRING>} 
     */
    UserData {
        get => this.get_UserData()
    }

    /**
     * Gets the list of overlay layers for the media composition.
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.overlaylayers
     * @type {IVector<MediaOverlayLayer>} 
     */
    OverlayLayers {
        get => this.get_OverlayLayers()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [MediaComposition](mediacomposition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Media.Editing.MediaComposition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.get_Duration()
    }

    /**
     * 
     * @returns {IVector<MediaClip>} 
     */
    get_Clips() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.get_Clips()
    }

    /**
     * 
     * @returns {IVector<BackgroundAudioTrack>} 
     */
    get_BackgroundAudioTracks() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.get_BackgroundAudioTracks()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    get_UserData() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.get_UserData()
    }

    /**
     * Creates a [MediaComposition](mediacomposition.md) object that is identical to this instance.
     * @returns {MediaComposition} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.clone
     */
    Clone() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.Clone()
    }

    /**
     * Asynchronously serializes the [MediaComposition](mediacomposition.md) to disk so that it can be loaded and modified in the future.
     * @remarks
     * This method saves the composition as an XML file containing metadata about the composition such as the source media files, arrangement of clips, overlays, and effects applied to the composition. A new media composition can be created from the saved XML file by calling [LoadAsync](mediacomposition_loadasync_1582010589.md).
     * 
     * To render a media composition as a video file so that it can be played back by standard media players, use the [RenderToFileAsync](/uwp/api/windows.media.editing.mediacomposition.rendertofileasync) method.
     * @param {IStorageFile} file_ The file to which the [MediaComposition](mediacomposition.md) is saved.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.saveasync
     */
    SaveAsync(file_) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.SaveAsync(file_)
    }

    /**
     * Asynchronously gets an image stream that represents a thumbnail of the media composition.
     * @remarks
     * If *scaledWidth* and *scaledHeight* are both set, the aspect ratio of the original [MediaComposition](mediacomposition.md) is ignored, and your values can alter the aspect ratio.
     * 
     * If either *scaledWidth* or *scaledHeight* but not both is specified, the value you provide controls that dimension but the aspect ratio is preserved (the other dimension is calculated based on factoring the original aspect ratio of the [MediaComposition](mediacomposition.md)).
     * @param {TimeSpan} timeFromStart Specifies the point in the timeline of the [MediaComposition](mediacomposition.md) from which to render the thumbnail, offset from the start of the [MediaComposition](mediacomposition.md).
     * @param {Integer} scaledWidth Specifies the target width at which to render. The default is 0. *scaledWidth* and/or *scaledHeight* can be optional; see Remarks.
     * @param {Integer} scaledHeight Specifies the target height at which to render. The default is 0. *scaledWidth* and/or *scaledHeight* can be optional; see Remarks.
     * @param {Integer} framePrecision Specifies the frame precision algorithm to use when retrieving the thumbnail.
     * @returns {IAsyncOperation<ImageStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.getthumbnailasync
     */
    GetThumbnailAsync(timeFromStart, scaledWidth, scaledHeight, framePrecision) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.GetThumbnailAsync(timeFromStart, scaledWidth, scaledHeight, framePrecision)
    }

    /**
     * Asynchronously gets a vector view of thumbnails of the media composition.
     * @remarks
     * If *scaledWidth* and *scaledHeight* are both set, the aspect ratio of the original [MediaComposition](mediacomposition.md) is ignored, and your values can alter the aspect ratio.
     * 
     * If either *scaledWidth* or *scaledHeight* but not both is specified, the value you provide controls that dimension but the aspect ratio is preserved (the other dimension is calculated based on factoring the original aspect ratio of the [MediaComposition](mediacomposition.md)).
     * @param {IIterable<TimeSpan>} timesFromStart Specifies the points in the timeline of the [MediaComposition](mediacomposition.md) from which to render the thumbnails, offset from the start of the [MediaComposition](mediacomposition.md).
     * @param {Integer} scaledWidth Specifies the target width at which to render. The default is 0. *scaledWidth* and/or *scaledHeight* can be optional; see Remarks.
     * @param {Integer} scaledHeight Specifies the target height at which to render. The default is 0. *scaledWidth* and/or *scaledHeight* can be optional; see Remarks.
     * @param {Integer} framePrecision Specifies the frame precision algorithm to use when retrieving the thumbnails.
     * @returns {IAsyncOperation<IVectorView<ImageStream>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.getthumbnailsasync
     */
    GetThumbnailsAsync(timesFromStart, scaledWidth, scaledHeight, framePrecision) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.GetThumbnailsAsync(timesFromStart, scaledWidth, scaledHeight, framePrecision)
    }

    /**
     * Asynchronously renders the [MediaComposition](mediacomposition.md) to a specified file using the indicated media trimming preference.
     * @remarks
     * This method saves the composition to a video file that can be played back with standard media players. If you want to save the composition as an XML file that can be loaded and modified in the future, use [SaveAsync](mediacomposition_saveasync_389603876.md).
     * @param {IStorageFile} destination The file to which this [MediaComposition](mediacomposition.md) is rendered.
     * @returns {IAsyncOperationWithProgress<Integer, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.rendertofileasync
     */
    RenderToFileAsync(destination) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.RenderToFileAsync(destination)
    }

    /**
     * Asynchronously renders the [MediaComposition](mediacomposition.md) to a specified file using the indicated media trimming preference and encoding profile.
     * @remarks
     * This method saves the composition to a video file that can be played back with standard media players. If you want to save the composition as an XML file that can be loaded and modified in the future, use [SaveAsync](mediacomposition_saveasync_389603876.md).
     * @param {IStorageFile} destination The file to which this [MediaComposition](mediacomposition.md) is rendered.
     * @param {Integer} trimmingPreference Specifies whether to be fast or precise when trimming the media.
     * @returns {IAsyncOperationWithProgress<Integer, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.rendertofileasync
     */
    RenderToFileWithTrimmingPreferenceAsync(destination, trimmingPreference) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.RenderToFileWithTrimmingPreferenceAsync(destination, trimmingPreference)
    }

    /**
     * Asynchronously renders the [MediaComposition](mediacomposition.md) to the specified file.
     * @remarks
     * This method saves the composition to a video file that can be played back with standard media players. If you want to save the composition as an XML file that can be loaded and modified in the future, use [SaveAsync](mediacomposition_saveasync_389603876.md).
     * @param {IStorageFile} destination The file to which this [MediaComposition](mediacomposition.md) is rendered.
     * @param {Integer} trimmingPreference 
     * @param {MediaEncodingProfile} encodingProfile 
     * @returns {IAsyncOperationWithProgress<Integer, Float>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.rendertofileasync
     */
    RenderToFileWithProfileAsync(destination, trimmingPreference, encodingProfile) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.RenderToFileWithProfileAsync(destination, trimmingPreference, encodingProfile)
    }

    /**
     * Create a new default media encoding profile which can be modified if necessary.
     * @returns {MediaEncodingProfile} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.createdefaultencodingprofile
     */
    CreateDefaultEncodingProfile() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.CreateDefaultEncodingProfile()
    }

    /**
     * Creates a new [MediaStreamSource](../windows.media.core/mediastreamsource.md) using the specified [MediaEncodingProfile](../windows.media.mediaproperties/mediaencodingprofile.md).
     * @returns {MediaStreamSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.generatemediastreamsource
     */
    GenerateMediaStreamSource() {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.GenerateMediaStreamSource()
    }

    /**
     * Creates a new [MediaStreamSource](../windows.media.core/mediastreamsource.md).
     * @param {MediaEncodingProfile} encodingProfile 
     * @returns {MediaStreamSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.generatemediastreamsource
     */
    GenerateMediaStreamSourceWithProfile(encodingProfile) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.GenerateMediaStreamSourceWithProfile(encodingProfile)
    }

    /**
     * Creates a new [MediaStreamSource](../windows.media.core/mediastreamsource.md) used to preview the edited media.
     * @param {Integer} scaledWidth The width of the preview media.
     * @param {Integer} scaledHeight The height of the preview media.
     * @returns {MediaStreamSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.editing.mediacomposition.generatepreviewmediastreamsource
     */
    GeneratePreviewMediaStreamSource(scaledWidth, scaledHeight) {
        if (!this.HasProp("__IMediaComposition")) {
            if ((queryResult := this.QueryInterface(IMediaComposition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition := IMediaComposition(outPtr)
        }

        return this.__IMediaComposition.GeneratePreviewMediaStreamSource(scaledWidth, scaledHeight)
    }

    /**
     * 
     * @returns {IVector<MediaOverlayLayer>} 
     */
    get_OverlayLayers() {
        if (!this.HasProp("__IMediaComposition2")) {
            if ((queryResult := this.QueryInterface(IMediaComposition2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaComposition2 := IMediaComposition2(outPtr)
        }

        return this.__IMediaComposition2.get_OverlayLayers()
    }

;@endregion Instance Methods
}
