#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VMR9Frequency.ahk

/**
 * The VMR9VideoDesc structure describes a video stream to be deinterlaced.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9videodesc
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9VideoDesc extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Size of the structure, in bytes.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Width of the video to be deinterlaced, in pixels.
     * @type {Integer}
     */
    dwSampleWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Height of the video to be deinterlaced, in pixels.
     * @type {Integer}
     */
    dwSampleHeight {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the interlacing format of the sample, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9_sampleformat">VMR9_SampleFormat</a> enumeration.
     * @type {Integer}
     */
    SampleFormat {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies the FOURCC code. Valid values include NV12, YV12, YUY2, UYVY, IMC1, IMC2, IMC3 and IMC4
     * @type {Integer}
     */
    dwFourCC {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9frequency">VMR9Frequency</a> structure that specifies the input frequency. For NTSC TV, the frequency would be expressed as 30,000:1001.
     * @type {VMR9Frequency}
     */
    InputSampleFreq{
        get {
            if(!this.HasProp("__InputSampleFreq"))
                this.__InputSampleFreq := VMR9Frequency(24, this)
            return this.__InputSampleFreq
        }
    }

    /**
     * A **VMRFrequency** structure that specifies the output frequency. For NTSC TV, the frequency would be expressed as 60,000:1001.
     * @type {VMR9Frequency}
     */
    OutputFrameFreq{
        get {
            if(!this.HasProp("__OutputFrameFreq"))
                this.__OutputFrameFreq := VMR9Frequency(32, this)
            return this.__OutputFrameFreq
        }
    }
}
