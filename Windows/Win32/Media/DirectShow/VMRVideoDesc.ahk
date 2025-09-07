#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VMRFrequency.ahk

/**
 * This topic applies to Windows XP Service Pack 1 or later. The VMRVideoDesc structure describes a video stream to be deinterlaced.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrvideodesc
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRVideoDesc extends Win32Struct
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
     * 
     * @type {Integer}
     */
    SingleFieldPerSample {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Specifies a FOURCC code. Valid values include NV12, YV12, YUY2, UYVY, IMC1, IMC2, IMC3 and IMC4
     * @type {Integer}
     */
    dwFourCC {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A [VMRFrequency](/windows/win32/api/strmif/ns-strmif-vmrfrequency structure that specifies the input frequency. For NTSC TV, the frequency would be expressed as 30,000:1001.
     * @type {VMRFrequency}
     */
    InputSampleFreq{
        get {
            if(!this.HasProp("__InputSampleFreq"))
                this.__InputSampleFreq := VMRFrequency(this.ptr + 24)
            return this.__InputSampleFreq
        }
    }

    /**
     * A [VMRFrequency](/windows/win32/api/strmif/ns-strmif-vmrfrequency) structure that specifies the output frequency. For NTSC TV, the frequency would be expressed as 60,000:1001.
     * @type {VMRFrequency}
     */
    OutputFrameFreq{
        get {
            if(!this.HasProp("__OutputFrameFreq"))
                this.__OutputFrameFreq := VMRFrequency(this.ptr + 32)
            return this.__OutputFrameFreq
        }
    }
}
