#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The VMR9AllocationInfo structure describes the Direct3D surfaces that a VMR-9 Allocator-Presenter object should allocate.
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ns-vmr9-vmr9allocationinfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9AllocationInfo extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9surfaceallocationflags">VMR9SurfaceAllocationFlags</a> enumeration type.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the width of the surfaces.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the height of the surfaces.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Specifies the surface format, as a <b>D3DFORMAT</b> type. The value D3DFMT_UNKNOWN (zero) indicates that the surface format should be compatible with the display.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Specifies the Direct3D memory pool to use for the surfaces, as a <b>D3DPOOL</b> type.
     * @type {Integer}
     */
    Pool {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Specifies the minimum number of buffers to create.
     * @type {Integer}
     */
    MinBuffers {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the video aspect ratio as a <b>SIZE</b> structure.
     * @type {SIZE}
     */
    szAspectRatio{
        get {
            if(!this.HasProp("__szAspectRatio"))
                this.__szAspectRatio := SIZE(this.ptr + 24)
            return this.__szAspectRatio
        }
    }

    /**
     * Specifies the native video size as a <b>SIZE</b> structure.
     * @type {SIZE}
     */
    szNativeSize{
        get {
            if(!this.HasProp("__szNativeSize"))
                this.__szNativeSize := SIZE(this.ptr + 32)
            return this.__szNativeSize
        }
    }
}
