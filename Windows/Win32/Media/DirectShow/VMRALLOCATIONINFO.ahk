#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The VMRALLOCATIONINFO structure is used in the VMR-7 filter's IVMRSurfaceAllocator::AllocateSurface method.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-vmrallocationinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRALLOCATIONINFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * A bitwise <b>OR</b> of flags from the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-vmrsurfaceallocationflags">VMRSurfaceAllocationFlags</a> enumeration.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the <b>BITMAPINFOHEADER</b> structure associated with the surface.
     * @type {Pointer<BITMAPINFOHEADER>}
     */
    lpHdr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to the <b>DDPIXELFORMAT</b> structure associated with the surface.
     * @type {Pointer<DDPIXELFORMAT>}
     */
    lpPixFmt {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that specifies the aspect ratio of the new surface.
     * @type {SIZE}
     */
    szAspectRatio{
        get {
            if(!this.HasProp("__szAspectRatio"))
                this.__szAspectRatio := SIZE(24, this)
            return this.__szAspectRatio
        }
    }

    /**
     * The minimum number of buffers to create for this surface.
     * @type {Integer}
     */
    dwMinBuffers {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The maximum number of buffers to create for this surface.
     * @type {Integer}
     */
    dwMaxBuffers {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * A bitwise <b>OR</b> of  flags that indicate the interlacing. For a list of flags, see the <b>dwInterlaceFlags</b> member of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a> structure.
     * @type {Integer}
     */
    dwInterlaceFlags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The size of the native video rectangle.
     * @type {SIZE}
     */
    szNativeSize{
        get {
            if(!this.HasProp("__szNativeSize"))
                this.__szNativeSize := SIZE(48, this)
            return this.__szNativeSize
        }
    }
}
