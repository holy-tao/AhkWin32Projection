#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VMRFrequency.ahk" { VMRFrequency }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * This topic applies to Windows XP Service Pack 1 or later. The VMRVideoDesc structure describes a video stream to be deinterlaced.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ns-strmif-vmrvideodesc
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMRVideoDesc {
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

    SingleFieldPerSample : BOOL

    /**
     * Specifies a FOURCC code. Valid values include NV12, YV12, YUY2, UYVY, IMC1, IMC2, IMC3 and IMC4
     */
    dwFourCC : UInt32

    /**
     * A [VMRFrequency](/windows/win32/api/strmif/ns-strmif-vmrfrequency structure that specifies the input frequency. For NTSC TV, the frequency would be expressed as 30,000:1001.
     */
    InputSampleFreq : VMRFrequency

    /**
     * A [VMRFrequency](/windows/win32/api/strmif/ns-strmif-vmrfrequency) structure that specifies the output frequency. For NTSC TV, the frequency would be expressed as 60,000:1001.
     */
    OutputFrameFreq : VMRFrequency

}
