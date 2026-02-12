#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAudioBuffer.ahk
#Include ..\Foundation\IMemoryBuffer.ahk
#Include ..\Foundation\IClosable.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a buffer containing audio data.
 * @remarks
 * Get an instance of this class by calling [AudioFrame.LockBuffer](audioframe_lockbuffer_1248676457.md).
 * @see https://learn.microsoft.com/uwp/api/windows.media.audiobuffer
 * @namespace Windows.Media
 * @version WindowsRuntime 1.4
 */
class AudioBuffer extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAudioBuffer

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAudioBuffer.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the maximum number of bytes that the buffer can hold.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audiobuffer.capacity
     * @type {Integer} 
     */
    Capacity {
        get => this.get_Capacity()
    }

    /**
     * Gets or sets the number of bytes currently in use in the buffer.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audiobuffer.length
     * @type {Integer} 
     */
    Length {
        get => this.get_Length()
        set => this.put_Length(value)
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
     * 
     * @returns {Integer} 
     */
    get_Capacity() {
        if (!this.HasProp("__IAudioBuffer")) {
            if ((queryResult := this.QueryInterface(IAudioBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioBuffer := IAudioBuffer(outPtr)
        }

        return this.__IAudioBuffer.get_Capacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Length() {
        if (!this.HasProp("__IAudioBuffer")) {
            if ((queryResult := this.QueryInterface(IAudioBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioBuffer := IAudioBuffer(outPtr)
        }

        return this.__IAudioBuffer.get_Length()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Length(value) {
        if (!this.HasProp("__IAudioBuffer")) {
            if ((queryResult := this.QueryInterface(IAudioBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAudioBuffer := IAudioBuffer(outPtr)
        }

        return this.__IAudioBuffer.put_Length(value)
    }

    /**
     * Returns an [IMemoryBufferReference](../windows.foundation/imemorybufferreference.md) representation of the audio buffer.
     * @remarks
     * The audio buffer is in the form of an array of samples.
     * Each sample is a series of IEEE single-precision floating point values
     * in a linear range from &minus;1.0 to +1.0, one value per channel.
     * The channels within a sample are in speaker number order,
     * as given in the documentation for
     * [**WAVEFORMATEXTENSIBLE**](/windows/win32/api/mmreg/ns-mmreg-waveformatextensible).
     * 
     * For example, in the case of a left/right two-channel audio buffer,
     * the floating point values are the left and right channels of the first sample,
     * followed by
     * the left and right channels of the second sample,
     * and so on.
     * @returns {IMemoryBufferReference} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audiobuffer.createreference
     */
    CreateReference() {
        if (!this.HasProp("__IMemoryBuffer")) {
            if ((queryResult := this.QueryInterface(IMemoryBuffer.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMemoryBuffer := IMemoryBuffer(outPtr)
        }

        return this.__IMemoryBuffer.CreateReference()
    }

    /**
     * Disposes of the object and associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audiobuffer.close
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
