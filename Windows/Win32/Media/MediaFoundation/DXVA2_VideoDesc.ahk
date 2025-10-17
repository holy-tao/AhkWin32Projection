#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DXVA2_ExtendedFormat.ahk
#Include .\DXVA2_Frequency.ahk

/**
 * Describes a video stream for a DXVA decoder device or video processor device.
 * @remarks
 * 
  * The <b>InputSampleFreq</b> member gives the frame rate of the decoded video stream, as received by the video renderer. The <b>OutputFrameFreq</b> member gives the frame rate of the video that is displayed after deinterlacing. If the input video is interlaced and the samples contain interleaved fields, the output frame rate is twice the input frame rate. If the input video is progressive or contains single fields, the output frame rate is the same as the input frame rate.
  * 
  * Decoders should set the values of <b>InputSampleFreq</b> and <b>OutputFrameFreq</b> if the frame rate is known. Otherwise, set these members to 0/0 to indicate an unknown frame rate.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_videodesc
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_VideoDesc extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Width of the video frame, in pixels.
     * @type {Integer}
     */
    SampleWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Height of the video frame, in pixels.
     * @type {Integer}
     */
    SampleHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Additional details about the video format, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_extendedformat">DXVA2_ExtendedFormat</a> structure.
     * @type {DXVA2_ExtendedFormat}
     */
    SampleFormat{
        get {
            if(!this.HasProp("__SampleFormat"))
                this.__SampleFormat := DXVA2_ExtendedFormat(8, this)
            return this.__SampleFormat
        }
    }

    /**
     * Surface format, specified as a <b>D3DFORMAT</b> value or FOURCC code. A FOURCC code can be constructed using the <b>D3DFORMAT</b> or <b>MAKEFOURCC</b> macros.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Frame rate of the input video stream, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_frequency">DXVA2_Frequency</a> structure.
     * @type {DXVA2_Frequency}
     */
    InputSampleFreq{
        get {
            if(!this.HasProp("__InputSampleFreq"))
                this.__InputSampleFreq := DXVA2_Frequency(16, this)
            return this.__InputSampleFreq
        }
    }

    /**
     * Frame rate of the output video, specified as a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_frequency">DXVA2_Frequency</a> structure.
     * @type {DXVA2_Frequency}
     */
    OutputFrameFreq{
        get {
            if(!this.HasProp("__OutputFrameFreq"))
                this.__OutputFrameFreq := DXVA2_Frequency(24, this)
            return this.__OutputFrameFreq
        }
    }

    /**
     * Level of data protection required when the user accessible bus (UAB) is present. If <b>TRUE</b>, the video must be protected when a UAB is present. If <b>FALSE</b>, the video is not required to be protected.
     * @type {Integer}
     */
    UABProtectionLevel {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Reserved. Must be zero.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
