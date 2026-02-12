#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioFrame.ahk
#Include .\IMediaFrame.ahk
#Include ..\Foundation\IClosable.ahk
#Include .\IAudioFrameFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a single frame of audio data.
 * @remarks
 * An audio frame typically contains multiple audio samples. Access the audio data by calling [LockBuffer](audioframe_lockbuffer_1248676457.md) which returns an [AudioBuffer](audiobuffer.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class AudioFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioFrame.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [AudioFrame](audioframe.md) class.
     * @param {Integer} capacity The maximum number of bytes that the buffer can hold.
     * @returns {AudioFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.#ctor
     */
    static Create(capacity) {
        if (!AudioFrame.HasProp("__IAudioFrameFactory")) {
            activatableClassId := HSTRING.Create("Windows.Media.AudioFrame")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAudioFrameFactory.IID)
            AudioFrame.__IAudioFrameFactory := IAudioFrameFactory(factoryPtr)
        }

        return AudioFrame.__IAudioFrameFactory.Create(capacity)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a string indicating the type of audio data the audio frame contains.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.type
     * @type {HSTRING} 
     */
    Type {
        get => this.get_Type()
    }

    /**
     * Gets a value indicating whether the audio frame is read-only.
     * @remarks
     * When this value is true, both the audio data and the mutable properties of the audio frame are read-only.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.isreadonly
     * @type {Boolean} 
     */
    IsReadOnly {
        get => this.get_IsReadOnly()
    }

    /**
     * Gets or sets the relative time of the frame within the audio stream.
     * @remarks
     * Use [SystemRelativeTime](audioframe_systemrelativetime.md) to get a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.relativetime
     * @type {IReference<TimeSpan>} 
     */
    RelativeTime {
        get => this.get_RelativeTime()
        set => this.put_RelativeTime(value)
    }

    /**
     * Gets or sets a timestamp that is relative to the system and is correlatable across multiple media sources on the same device.
     * @remarks
     * Use [RelativeTime](audioframe_relativetime.md) to get a timestamp that is relative to the audio stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.systemrelativetime
     * @type {IReference<TimeSpan>} 
     */
    SystemRelativeTime {
        get => this.get_SystemRelativeTime()
        set => this.put_SystemRelativeTime(value)
    }

    /**
     * Gets or sets the duration of the audio frame.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.duration
     * @type {IReference<TimeSpan>} 
     */
    Duration {
        get => this.get_Duration()
        set => this.put_Duration(value)
    }

    /**
     * Gets or sets a value that indicates whether an audio frame is the first frame after a gap in the stream.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.isdiscontinuous
     * @type {Boolean} 
     */
    IsDiscontinuous {
        get => this.get_IsDiscontinuous()
        set => this.put_IsDiscontinuous(value)
    }

    /**
     * Gets the extended property set which enables getting and setting properties on the [AudioFrame](audioframe.md).
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.extendedproperties
     * @type {IPropertySet} 
     */
    ExtendedProperties {
        get => this.get_ExtendedProperties()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Gets a [AudioBuffer](audiobuffer.md) object that allows you to operate directly on the frame's audio data.
     * @param {Integer} mode_ A value indicating the access mode of the returned audio buffer.
     * @returns {AudioBuffer} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.lockbuffer
     */
    LockBuffer(mode_) {
        if (!this.HasProp("__IAudioFrame")) {
            if ((queryResult := this.QueryInterface(IAudioFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioFrame := IAudioFrame(outPtr)
        }

        return this.__IAudioFrame.LockBuffer(mode_)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Type() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Type()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsReadOnly() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsReadOnly()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_RelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_RelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_RelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_RelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_SystemRelativeTime(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_SystemRelativeTime(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_SystemRelativeTime() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_SystemRelativeTime()
    }

    /**
     * 
     * @param {IReference<TimeSpan>} value 
     * @returns {HRESULT} 
     */
    put_Duration(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_Duration(value)
    }

    /**
     * 
     * @returns {IReference<TimeSpan>} 
     */
    get_Duration() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_Duration()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsDiscontinuous(value) {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.put_IsDiscontinuous(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscontinuous() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_IsDiscontinuous()
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_ExtendedProperties() {
        if (!this.HasProp("__IMediaFrame")) {
            if ((queryResult := this.QueryInterface(IMediaFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMediaFrame := IMediaFrame(outPtr)
        }

        return this.__IMediaFrame.get_ExtendedProperties()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audioframe.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
