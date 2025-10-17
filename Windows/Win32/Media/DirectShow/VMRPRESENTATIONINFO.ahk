#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * The VMRPRESENTATIONINFO structure is used in the IVMRImagePresenter::PresentImage method (VMR-7 only).
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-vmrpresentationinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRPRESENTATIONINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A bitwise combination of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrpresentationflags">VMRPresentationFlags</a> enumeration, which describe the status of the video sample with respect to its presentation time.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the DirectDraw surface that contains the video frame to be presented.
     * @type {Pointer<IDirectDrawSurface7>}
     */
    lpSurf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The start time for the current frame, in 100-nanosecond units.
     * @type {Integer}
     */
    rtStart {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The end time for the current frame, in 100-nanosecond units.
     * @type {Integer}
     */
    rtEnd {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The aspect ratio of the rectangle.
     * @type {SIZE}
     */
    szAspectRatio{
        get {
            if(!this.HasProp("__szAspectRatio"))
                this.__szAspectRatio := SIZE(32, this)
            return this.__szAspectRatio
        }
    }

    /**
     * The source rectangle.
     * @type {RECT}
     */
    rcSrc{
        get {
            if(!this.HasProp("__rcSrc"))
                this.__rcSrc := RECT(40, this)
            return this.__rcSrc
        }
    }

    /**
     * The destination rectangle.
     * @type {RECT}
     */
    rcDst{
        get {
            if(!this.HasProp("__rcDst"))
                this.__rcDst := RECT(56, this)
            return this.__rcDst
        }
    }

    /**
     * Bitwise combination of flags, as defined for the [AM_SAMPLE2_PROPERTIES](/windows/desktop/api/strmif/ns-strmif-am_sample2_properties) structure.
     * @type {Integer}
     */
    dwTypeSpecificFlags {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Bitwise combination of flags, as defined for the <b>dwInterlaceFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     * @type {Integer}
     */
    dwInterlaceFlags {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }
}
