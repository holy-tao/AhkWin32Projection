#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VMR9_SampleFormat.ahk" { VMR9_SampleFormat }
#Import ".\VMR9Frequency.ahk" { VMR9Frequency }

/**
 * The VMR9VideoDesc structure describes a video stream to be deinterlaced.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9videodesc
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9VideoDesc {
    #StructPack 4

    /**
     * Size of the structure, in bytes.
     */
    dwSize : UInt32

    /**
     * Width of the video to be deinterlaced, in pixels.
     */
    dwSampleWidth : UInt32

    /**
     * Height of the video to be deinterlaced, in pixels.
     */
    dwSampleHeight : UInt32

    /**
     * Specifies the interlacing format of the sample, as a member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9_sampleformat">VMR9_SampleFormat</a> enumeration.
     */
    SampleFormat : VMR9_SampleFormat

    /**
     * Specifies the FOURCC code. Valid values include NV12, YV12, YUY2, UYVY, IMC1, IMC2, IMC3 and IMC4
     */
    dwFourCC : UInt32

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ns-vmr9-vmr9frequency">VMR9Frequency</a> structure that specifies the input frequency. For NTSC TV, the frequency would be expressed as 30,000:1001.
     */
    InputSampleFreq : VMR9Frequency

    /**
     * A **VMRFrequency** structure that specifies the output frequency. For NTSC TV, the frequency would be expressed as 60,000:1001.
     */
    OutputFrameFreq : VMR9Frequency

}
