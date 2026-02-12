#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioMediaFrame.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a frame of audio data retreived from a [MediaFrameSource](mediaframesource.md).
 * @remarks
 * Get an instance of this class by accessing the [AudioMediaFrame](mediaframereference_audiomediaframe.md) property of a [MediaFrameReference](mediaframereference.md) object that was obtained from a media frame source with a call to [MediaFrameReader.TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md). Call [GetAudioFrame](audiomediaframe_getaudioframe_2089312515.md) to get a copy of the frame as an [AudioFrame](../windows.media/audioframe.md) object, which provides access to the underlying audio data.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.audiomediaframe
 * @namespace Windows.Media.Capture.Frames
 * @version WindowsRuntime 1.4
 */
class AudioMediaFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioMediaFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioMediaFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [MediaFrameReference](mediaframereference.md) wrapper object associated with the [AudioMediaFrame](audiomediaframe.md), which provides access to format information and other properties of the media frame.
     * @remarks
     * The [TryAcquireLatestFrame](mediaframereader_tryacquirelatestframe_612769713.md) method, which acquires the latest media frame from a [MediaFrameReader](mediaframereader.md), returns a **MediaFrameReference** which is a wrapper class for all types of media frames. If the reference wraps an audio frame, use the [MediaFrameReference.AudioMediaFrame](mediaframereference_audiomediaframe.md) property to get an **AudioMediaFrame** instance. This property lets you get the **MediaFrameReference** object from which the **AudioMediaFrame** was obtained.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.audiomediaframe.framereference
     * @type {MediaFrameReference} 
     */
    FrameReference {
        get => this.get_FrameReference()
    }

    /**
     * Gets an [AudioEncodingProperties](../windows.media.mediaproperties/audioencodingproperties.md) object that provides information about the audio data in the frame. This includes information like the bitrate, sample rate, and channel count of the audio data.
     * @remarks
     * Use the [CurrentFormat](mediaframesource_currentformat.md) property of a [MediaFrameSource](mediaframesource.md) object to retrieve a [MediaFrameFormat](mediaframeformat.md) object describing the format of the media being provided by the source. For audio sources, you can check the [MediaFrameFormat.AudioEncodingProperties](mediaframeformat_audioencodingproperties.md) to determine the format of the audio data the source produces.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.audiomediaframe.audioencodingproperties
     * @type {AudioEncodingProperties} 
     */
    AudioEncodingProperties {
        get => this.get_AudioEncodingProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {MediaFrameReference} 
     */
    get_FrameReference() {
        if (!this.HasProp("__IAudioMediaFrame")) {
            if ((queryResult := this.QueryInterface(IAudioMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioMediaFrame := IAudioMediaFrame(outPtr)
        }

        return this.__IAudioMediaFrame.get_FrameReference()
    }

    /**
     * 
     * @returns {AudioEncodingProperties} 
     */
    get_AudioEncodingProperties() {
        if (!this.HasProp("__IAudioMediaFrame")) {
            if ((queryResult := this.QueryInterface(IAudioMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioMediaFrame := IAudioMediaFrame(outPtr)
        }

        return this.__IAudioMediaFrame.get_AudioEncodingProperties()
    }

    /**
     * Creates a copy of the [AudioMediaFrame](audiomediaframe.md) as an [AudioFrame](../windows.media/audioframe.md) object.
     * @remarks
     * The **AudioFrame** class provides the [LockBuffer](../windows.media/audioframe_lockbuffer_1248676457.md) method, which returns an [AudioBuffer](../windows.media/audiobuffer.md) object that you can use to access audio samples contained in the frame.
     * @returns {AudioFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.frames.audiomediaframe.getaudioframe
     */
    GetAudioFrame() {
        if (!this.HasProp("__IAudioMediaFrame")) {
            if ((queryResult := this.QueryInterface(IAudioMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioMediaFrame := IAudioMediaFrame(outPtr)
        }

        return this.__IAudioMediaFrame.GetAudioFrame()
    }

;@endregion Instance Methods
}
