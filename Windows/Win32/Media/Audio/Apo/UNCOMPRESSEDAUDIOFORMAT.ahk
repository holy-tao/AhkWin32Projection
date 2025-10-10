#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The UNCOMPRESSEDAUDIOFORMAT structure specifies the frame rate, channel mask, and other attributes of the uncompressed audio data format.
 * @remarks
 * 
  * This structure provides access to the parameters that describe an uncompressed PCM audio format.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//audiomediatype/ns-audiomediatype-uncompressedaudioformat
 * @namespace Windows.Win32.Media.Audio.Apo
 * @version v4.0.30319
 */
class UNCOMPRESSEDAUDIOFORMAT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Specifies the GUID of the data format type.
     * @type {Pointer<Guid>}
     */
    guidFormatType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the number of samples per frame.
     * @type {Integer}
     */
    dwSamplesPerFrame {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the number of bytes that make up a unit container of the sample.
     * @type {Integer}
     */
    dwBytesPerSampleContainer {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the number of valid bits per sample.
     * @type {Integer}
     */
    dwValidBitsPerSample {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the number of frames per second of streaming audio data.
     * @type {Float}
     */
    fFramesPerSecond {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }

    /**
     * Specifies the channel mask that is used by the uncompressed audio data.
     * @type {Integer}
     */
    dwChannelMask {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
