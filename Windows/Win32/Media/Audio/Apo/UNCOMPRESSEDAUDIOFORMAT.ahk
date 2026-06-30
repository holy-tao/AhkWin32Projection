#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * The UNCOMPRESSEDAUDIOFORMAT structure specifies the frame rate, channel mask, and other attributes of the uncompressed audio data format.
 * @remarks
 * This structure provides access to the parameters that describe an uncompressed PCM audio format.
 * @see https://learn.microsoft.com/windows/win32/api/audiomediatype/ns-audiomediatype-uncompressedaudioformat
 * @namespace Windows.Win32.Media.Audio.Apo
 */
class UNCOMPRESSEDAUDIOFORMAT extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * Specifies the GUID of the data format type.
     * @type {Guid}
     */
    guidFormatType {
        get {
            if(!this.HasProp("__guidFormatType"))
                this.__guidFormatType := Guid(0, this)
            return this.__guidFormatType
        }
    }

    /**
     * Specifies the number of samples per frame.
     * @type {Integer}
     */
    dwSamplesPerFrame {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of bytes that make up a unit container of the sample.
     * @type {Integer}
     */
    dwBytesPerSampleContainer {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the number of valid bits per sample.
     * @type {Integer}
     */
    dwValidBitsPerSample {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Specifies the number of frames per second of streaming audio data.
     * @type {Float}
     */
    fFramesPerSecond {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Specifies the channel mask that is used by the uncompressed audio data.
     * @type {Integer}
     */
    dwChannelMask {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
