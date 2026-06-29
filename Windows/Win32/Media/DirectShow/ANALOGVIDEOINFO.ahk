#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The ANALOGVIDEOINFO structure maintains information about the format of the analog video signal.
 * @remarks
 * Filters using this format usually pass the video signal using a hardware-based connection rather than using memory-based transports.
 * 
 * An example of a definition of an analog video media type connection would be a connection of NTSC video using "M" color encoding. This would use a major media type of MEDIATYPE_AnalogVideo, a subtype of MEDIASUBTYPE_AnalogVideo_NTSC_M, and a format type of FORMAT_AnalogVideo.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-analogvideoinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct ANALOGVIDEOINFO {
    #StructPack 8

    /**
     * Source video rectangle.
     */
    rcSource : RECT

    /**
     * Destination target rectangle.
     */
    rcTarget : RECT

    /**
     * Source video width.
     */
    dwActiveWidth : UInt32

    /**
     * Source video height (483 for NTSC, 575 for PAL/SECAM).
     */
    dwActiveHeight : UInt32

    /**
     * Average time per frame in 100-nanosecond units.
     */
    AvgTimePerFrame : Int64

}
