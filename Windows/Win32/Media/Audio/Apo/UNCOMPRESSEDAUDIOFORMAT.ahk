#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * The UNCOMPRESSEDAUDIOFORMAT structure specifies the frame rate, channel mask, and other attributes of the uncompressed audio data format.
 * @remarks
 * This structure provides access to the parameters that describe an uncompressed PCM audio format.
 * @see https://learn.microsoft.com/windows/win32/api/audiomediatype/ns-audiomediatype-uncompressedaudioformat
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct UNCOMPRESSEDAUDIOFORMAT {
    #StructPack 4

    /**
     * Specifies the GUID of the data format type.
     */
    guidFormatType : Guid

    /**
     * Specifies the number of samples per frame.
     */
    dwSamplesPerFrame : UInt32

    /**
     * Specifies the number of bytes that make up a unit container of the sample.
     */
    dwBytesPerSampleContainer : UInt32

    /**
     * Specifies the number of valid bits per sample.
     */
    dwValidBitsPerSample : UInt32

    /**
     * Specifies the number of frames per second of streaming audio data.
     */
    fFramesPerSecond : Float32

    /**
     * Specifies the channel mask that is used by the uncompressed audio data.
     */
    dwChannelMask : UInt32

}
