#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The ANALOGVIDEOINFO structure maintains information about the format of the analog video signal.
 * @remarks
 * Filters using this format usually pass the video signal using a hardware-based connection rather than using memory-based transports.
  * 
  * An example of a definition of an analog video media type connection would be a connection of NTSC video using "M" color encoding. This would use a major media type of MEDIATYPE_AnalogVideo, a subtype of MEDIASUBTYPE_AnalogVideo_NTSC_M, and a format type of FORMAT_AnalogVideo.
 * @see https://learn.microsoft.com/windows/win32/api/amvideo/ns-amvideo-analogvideoinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class ANALOGVIDEOINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Source video rectangle.
     * @type {RECT}
     */
    rcSource{
        get {
            if(!this.HasProp("__rcSource"))
                this.__rcSource := RECT(this.ptr + 0)
            return this.__rcSource
        }
    }

    /**
     * Destination target rectangle.
     * @type {RECT}
     */
    rcTarget{
        get {
            if(!this.HasProp("__rcTarget"))
                this.__rcTarget := RECT(this.ptr + 16)
            return this.__rcTarget
        }
    }

    /**
     * Source video width.
     * @type {Integer}
     */
    dwActiveWidth {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Source video height (483 for NTSC, 575 for PAL/SECAM).
     * @type {Integer}
     */
    dwActiveHeight {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Average time per frame in 100-nanosecond units.
     * @type {Integer}
     */
    AvgTimePerFrame {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }
}
