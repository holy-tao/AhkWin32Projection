#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DPOOL.ahk" { D3DPOOL }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * The VMR9AllocationInfo structure describes the Direct3D surfaces that a VMR-9 Allocator-Presenter object should allocate.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9allocationinfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9AllocationInfo {
    #StructPack 4

    /**
     * Specifies a bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9surfaceallocationflags">VMR9SurfaceAllocationFlags</a> enumeration type.
     */
    dwFlags : UInt32

    /**
     * Specifies the width of the surfaces.
     */
    dwWidth : UInt32

    /**
     * Specifies the height of the surfaces.
     */
    dwHeight : UInt32

    /**
     * Specifies the surface format, as a <b>D3DFORMAT</b> type. The value D3DFMT_UNKNOWN (zero) indicates that the surface format should be compatible with the display.
     */
    Format : D3DFORMAT

    /**
     * Specifies the Direct3D memory pool to use for the surfaces, as a <b>D3DPOOL</b> type.
     */
    Pool : D3DPOOL

    /**
     * Specifies the minimum number of buffers to create.
     */
    MinBuffers : UInt32

    /**
     * Specifies the video aspect ratio as a <b>SIZE</b> structure.
     */
    szAspectRatio : SIZE

    /**
     * Specifies the native video size as a <b>SIZE</b> structure.
     */
    szNativeSize : SIZE

}
