#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVideoStreamDescriptor.ahk
#Include .\IMediaStreamDescriptor.ahk
#Include .\IMediaStreamDescriptor2.ahk
#Include .\IVideoStreamDescriptor2.ahk
#Include .\IVideoStreamDescriptorFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a description a video media stream.
 * @remarks
 * When creating a [MediaEncodingProfile](../windows.media.mediaproperties/mediaencodingprofile.md), call [SetVideoTracks](../windows.media.mediaproperties/mediaencodingprofile_setvideotracks_1424215491.md), passing in one or more **VideoStreamDescriptor** objects to provide information about the video tracks to be encoded.
 * 
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a UWP app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class VideoStreamDescriptor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVideoStreamDescriptor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVideoStreamDescriptor.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of the [VideoStreamDescriptor](videostreamdescriptor.md) class using the specified [VideoEncodingProperties](../windows.media.mediaproperties/videoencodingproperties.md).
     * @param {VideoEncodingProperties} encodingProperties The encoding properties for the video stream. This includes information such as the resolution and frame rate of the content.
     * @returns {VideoStreamDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.#ctor
     */
    static Create(encodingProperties) {
        if (!VideoStreamDescriptor.HasProp("__IVideoStreamDescriptorFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.VideoStreamDescriptor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVideoStreamDescriptorFactory.IID)
            VideoStreamDescriptor.__IVideoStreamDescriptorFactory := IVideoStreamDescriptorFactory(factoryPtr)
        }

        return VideoStreamDescriptor.__IVideoStreamDescriptorFactory.Create(encodingProperties)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets an object describing the encoding properties for the video stream. These properties include the resolution and frame rate of the video.
     * @remarks
     * If the media pipeline cannot handle the encoding properties, a [MediaStreamSource](mediastreamsource.md) will raise the [Closed](mediastreamsource_closed.md) event which provides information regarding the error.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.encodingproperties
     * @type {VideoEncodingProperties} 
     */
    EncodingProperties {
        get => this.get_EncodingProperties()
    }

    /**
     * Gets a value indicating whether the stream is currently in use by a [MediaStreamSource](mediastreamsource.md).
     * @remarks
     * IsSelected is **true** if the stream represented by the stream descriptor is currently selected by the media pipeline. For example, if it is currently in use by a [MediaStreamSource](mediastreamsource.md). Otherwise, the value is **false**.
     * 
     * [MediaStreamSource](mediastreamsource.md) only raises the [SampleRequested](mediastreamsource_samplerequested.md) event for streams which are selected.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.isselected
     * @type {Boolean} 
     */
    IsSelected {
        get => this.get_IsSelected()
    }

    /**
     * Gets or sets the name of the stream.
     * @remarks
     * The initial value is an empty string.
     * 
     * The name is a free-form human readable string that describes the stream, for example, “English soundtrack”.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * Gets or sets the RFC-1766 language code for the stream.
     * @remarks
     * The initial value is an empty string.
     * 
     * The language is specified using a RFC-1766 language code, for example, “en-US”.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.language
     * @type {HSTRING} 
     */
    Language {
        get => this.get_Language()
        set => this.put_Language(value)
    }

    /**
     * Gets or sets an app-defined label that identifies a video stream in a [MediaEncodingProfile](/uwp/api/Windows.Media.MediaProperties.MediaEncodingProfile) that contains multiple streams.
     * @remarks
     * The label for each stream in a single **MediaEncodingProfile** must be unique. Calling [SetVideoTracks](/uwp/api/windows.media.mediaproperties.mediaencodingprofile#Windows_Media_MediaProperties_MediaEncodingProfile_SetVideoTracks_Windows_Foundation_Collections_IIterable_Windows_Media_Core_VideoStreamDescriptor__) to add a stream descriptor containing a duplicate label will result in an invalid argument error.
     * 
     * If you use a [MediaFrameSourceGroup](/uwp/api/windows.media.capture.frames.mediaframesourcegroup) to capture multiple video streams at once, the system will attempt to match the **Label** property of each **VideoStreamDescriptor** with the [Id](/uwp/api/windows.media.capture.frames.mediaframesourceinfo.Id) property of each [Media​Frame​Source​Info](/uwp/api/windows.media.capture.frames.mediaframesourceinfo) in the group in order to match the capture device with the approproate stream descriptor.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.label
     * @type {HSTRING} 
     */
    Label {
        get => this.get_Label()
        set => this.put_Label(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VideoEncodingProperties} 
     */
    get_EncodingProperties() {
        if (!this.HasProp("__IVideoStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IVideoStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStreamDescriptor := IVideoStreamDescriptor(outPtr)
        }

        return this.__IVideoStreamDescriptor.get_EncodingProperties()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSelected() {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.get_IsSelected()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Name(value) {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.put_Name(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.get_Name()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Language(value) {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.put_Language(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Language() {
        if (!this.HasProp("__IMediaStreamDescriptor")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor := IMediaStreamDescriptor(outPtr)
        }

        return this.__IMediaStreamDescriptor.get_Language()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Label(value) {
        if (!this.HasProp("__IMediaStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor2 := IMediaStreamDescriptor2(outPtr)
        }

        return this.__IMediaStreamDescriptor2.put_Label(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Label() {
        if (!this.HasProp("__IMediaStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IMediaStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamDescriptor2 := IMediaStreamDescriptor2(outPtr)
        }

        return this.__IMediaStreamDescriptor2.get_Label()
    }

    /**
     * Creates a copy of the [Windows.Media.Core.VideoStreamDescriptor](videostreamdescriptor.md).
     * @returns {VideoStreamDescriptor} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.videostreamdescriptor.copy
     */
    Copy() {
        if (!this.HasProp("__IVideoStreamDescriptor2")) {
            if ((queryResult := this.QueryInterface(IVideoStreamDescriptor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVideoStreamDescriptor2 := IVideoStreamDescriptor2(outPtr)
        }

        return this.__IVideoStreamDescriptor2.Copy()
    }

;@endregion Instance Methods
}
