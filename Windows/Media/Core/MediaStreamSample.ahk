#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMediaStreamSample.ahk
#Include .\IMediaStreamSample2.ahk
#Include .\IMediaStreamSampleStatics2.ahk
#Include .\IMediaStreamSampleStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\MediaStreamSample.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a media sample used by the [MediaStreamSource](mediastreamsource.md).
 * @remarks
 * See the [MediaStreamSource Sample](https://github.com/microsoftarchive/msdn-code-gallery-microsoft/tree/master/Official%20Windows%20Platform%20Sample/MediaStreamSource%20streaming%20sample) for an example of using Media Stream Source in a Universal Windows app.
 * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class MediaStreamSample extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMediaStreamSample

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMediaStreamSample.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [MediaStreamSample](mediastreamsample.md) from an [IDirect3DSurface](/uwp/api/Windows.Graphics.DirectX.Direct3D11.IDirect3DSurface).
     * @remarks
     * For certain formats, the decode time and the presentation time of a [MediaStreamSample](mediastreamsample.md) are different. The decode time can be accessed through the [DecodeTimestamp](mediastreamsample_decodetimestamp.md) property.
     * @param {IDirect3DSurface} surface The surface that contains the media data used to create the [MediaStreamSample](mediastreamsample.md).
     * @param {TimeSpan} timestamp_ The presentation time of this sample.
     * @returns {MediaStreamSample} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.createfromdirect3d11surface
     */
    static CreateFromDirect3D11Surface(surface, timestamp_) {
        if (!MediaStreamSample.HasProp("__IMediaStreamSampleStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaStreamSample")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaStreamSampleStatics2.IID)
            MediaStreamSample.__IMediaStreamSampleStatics2 := IMediaStreamSampleStatics2(factoryPtr)
        }

        return MediaStreamSample.__IMediaStreamSampleStatics2.CreateFromDirect3D11Surface(surface, timestamp_)
    }

    /**
     * Creates a [MediaStreamSample](mediastreamsample.md) from an [IBuffer](/previous-versions/hh438362(v=vs.85)).
     * @remarks
     * For certain formats, the decode time and the presentation time of a [MediaStreamSample](mediastreamsample.md) are different. The decode time can be accessed through the [DecodeTimestamp](mediastreamsample_decodetimestamp.md) property.
     * @param {IBuffer} buffer_ The buffer that contains the media data used to create the [MediaStreamSample](mediastreamsample.md).
     * @param {TimeSpan} timestamp_ The presentation time of this sample.
     * @returns {MediaStreamSample} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.createfrombuffer
     */
    static CreateFromBuffer(buffer_, timestamp_) {
        if (!MediaStreamSample.HasProp("__IMediaStreamSampleStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaStreamSample")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaStreamSampleStatics.IID)
            MediaStreamSample.__IMediaStreamSampleStatics := IMediaStreamSampleStatics(factoryPtr)
        }

        return MediaStreamSample.__IMediaStreamSampleStatics.CreateFromBuffer(buffer_, timestamp_)
    }

    /**
     * Asynchronously creates a [MediaStreamSample](mediastreamsample.md) from an [IInputStream](/previous-versions/hh438387(v=vs.85)).
     * @remarks
     * For certain formats, the decode time and the presentation time of a [MediaStreamSample](mediastreamsample.md) are different. The decode time can be accessed through the [DecodeTimestamp](mediastreamsample_decodetimestamp.md) property.
     * @param {IInputStream} stream The stream that contains the media data used to create the [MediaStreamSample](mediastreamsample.md).
     * @param {Integer} count The length of the data in the sample. This is the number of bytes that will be read from *stream*.
     * @param {TimeSpan} timestamp_ The presentation time of this [MediaStreamSample](mediastreamsample.md).
     * @returns {IAsyncOperation<MediaStreamSample>} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.createfromstreamasync
     */
    static CreateFromStreamAsync(stream, count, timestamp_) {
        if (!MediaStreamSample.HasProp("__IMediaStreamSampleStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Core.MediaStreamSample")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IMediaStreamSampleStatics.IID)
            MediaStreamSample.__IMediaStreamSampleStatics := IMediaStreamSampleStatics(factoryPtr)
        }

        return MediaStreamSample.__IMediaStreamSampleStatics.CreateFromStreamAsync(stream, count, timestamp_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the buffer which encapsulates the [MediaStreamSample](mediastreamsample.md) data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.buffer
     * @type {WinRTBuffer} 
     */
    Buffer {
        get => this.get_Buffer()
    }

    /**
     * Gets the time at which a sample should be rendered. This is also referred to as the presentation time.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.timestamp
     * @type {TimeSpan} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * Gets the extended property set which enables getting and setting properties on the [MediaStreamSample](mediastreamsample.md).
     * @remarks
     * The ExtendedProperties is used for less common properties which are not directly accessible on the [MediaStreamSamplePropertySet](mediastreamsamplepropertyset.md) object. The properties are accessed through their [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) values. For example, the video stride property is accessed through the GUID value “0x644b4e48, 0x1e02, 0x4516, 0xb0, 0xeb, 0xc0, 0x1c, 0xa9, 0xd4, 0x9a, 0xc6”, which is the GUID for [MF_MT_DEFAULT_STRIDE](/windows/desktop/medfound/mf-mt-default-stride-attribute).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.extendedproperties
     * @type {MediaStreamSamplePropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

    /**
     * Gets a [MediaStreamSampleProtectionProperties](mediastreamsampleprotectionproperties.md) object, which is used for getting and setting properties that are specific to the Digital Rights Management (DRM) protection of the [MediaStreamSample](mediastreamsample.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.protection
     * @type {MediaStreamSampleProtectionProperties} 
     */
    Protection {
        get => this.get_Protection()
    }

    /**
     * Gets and sets the decode timestamp for this [MediaStreamSample](mediastreamsample.md).
     * @remarks
     * The default value of DecodeTimestamp is the same value as the [Timestamp](mediastreamsample_timestamp.md) property on the [MediaStreamSample](mediastreamsample.md) object. Certain media formats may require the DecodeTimestamp property to be assigned a value that is different from the presentation timestamp given by the [Timestamp](mediastreamsample_timestamp.md) property, but for most formats the two properties will be the same.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.decodetimestamp
     * @type {TimeSpan} 
     */
    DecodeTimestamp {
        get => this.get_DecodeTimestamp()
        set => this.put_DecodeTimestamp(value)
    }

    /**
     * Gets the duration of the sample.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that indicates the [MediaStreamSample](mediastreamsample.md) contains a keyframe.
     * @remarks
     * This flag should be set to **true** when the [MediaStreamSample](mediastreamsample.md) contains an audio or video frame which can be independently decoded from other frames. Such frames are sometimes referred to as cleanpoints, I-frames, IDR-frames or key frames.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.keyframe
     * @type {Boolean} 
     */
    KeyFrame {
        get => this.get_KeyFrame()
        set => this.put_KeyFrame(value)
    }

    /**
     * Gets or sets a value to indicate that the previous [MediaStreamSample](mediastreamsample.md) in the sequence is missing.
     * @remarks
     * Applications should set this property to **true** when the previous [MediaStreamSample](mediastreamsample.md) in the sequence is missing. An example of a situation when this can occur is when samples are received over a lossy network connection. The default value is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.discontinuous
     * @type {Boolean} 
     */
    Discontinuous {
        get => this.get_Discontinuous()
        set => this.put_Discontinuous(value)
    }

    /**
     * Gets the IDirect3DSurface which encapsulates the [MediaStreamSample](mediastreamsample.md) data.
     * @see https://learn.microsoft.com/uwp/api/windows.media.core.mediastreamsample.direct3d11surface
     * @type {IDirect3DSurface} 
     */
    Direct3D11Surface {
        get => this.get_Direct3D11Surface()
    }

    /**
     * Occurs when the MediaStreamSample has been processed by the media pipeline.
     * @remarks
     * When this event has been raised, it is safe to reuse the [IBuffer](/previous-versions/hh438362(v=vs.85)) from this [MediaStreamSample](mediastreamsample.md) in a new [MediaStreamSample](mediastreamsample.md). This allows an application to have a pool of buffers which are reused across multiple [MediaStreamSample](mediastreamsample.md) objects, rather than allocating a new buffer for each new [MediaStreamSample](mediastreamsample.md).
     * 
     * The event is informational. Applications are not required to have a handler for this event.
     * @type {TypedEventHandler<MediaStreamSample, IInspectable>}
    */
    OnProcessed {
        get {
            if(!this.HasProp("__OnProcessed")){
                this.__OnProcessed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d4dc5ef1-c1cb-5c32-803d-f2f9a7ad9916}"),
                    MediaStreamSample,
                    IInspectable
                )
                this.__OnProcessedToken := this.add_Processed(this.__OnProcessed.iface)
            }
            return this.__OnProcessed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnProcessedToken")) {
            this.remove_Processed(this.__OnProcessedToken)
            this.__OnProcessed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<MediaStreamSample, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Processed(handler) {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.add_Processed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Processed(token) {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.remove_Processed(token)
    }

    /**
     * 
     * @returns {WinRTBuffer} 
     */
    get_Buffer() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_Buffer()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_Timestamp()
    }

    /**
     * 
     * @returns {MediaStreamSamplePropertySet} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_ExtendedProperties()
    }

    /**
     * 
     * @returns {MediaStreamSampleProtectionProperties} 
     */
    get_Protection() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_Protection()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DecodeTimestamp(value) {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.put_DecodeTimestamp(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DecodeTimestamp() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_DecodeTimestamp()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.put_Duration(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_Duration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_KeyFrame(value) {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.put_KeyFrame(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_KeyFrame() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_KeyFrame()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Discontinuous(value) {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.put_Discontinuous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Discontinuous() {
        if (!this.HasProp("__IMediaStreamSample")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample := IMediaStreamSample(outPtr)
        }

        return this.__IMediaStreamSample.get_Discontinuous()
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3D11Surface() {
        if (!this.HasProp("__IMediaStreamSample2")) {
            if ((queryResult := this.QueryInterface(IMediaStreamSample2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaStreamSample2 := IMediaStreamSample2(outPtr)
        }

        return this.__IMediaStreamSample2.get_Direct3D11Surface()
    }

;@endregion Instance Methods
}
