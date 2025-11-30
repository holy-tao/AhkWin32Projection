#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The VMRSurfaceAllocationFlags enumeration is used with the IVMRSurfaceAllocator::AllocateSurface method to specify surface creation parameters.
 * @remarks
 * 
 * AMAP_3D_TARGET cannot be combined with AMAP_FORCE_SYSMEM or AMAP_ALLOW_SYSMEM because 3D surfaces cannot be created in system memory.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-vmrsurfaceallocationflags
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMRSurfaceAllocationFlags extends Win32Enum{

    /**
     * Indicates that the <b>lpPxFmt</b> field contains valid data that should be used to create the DirectDraw surface.
     * @type {Integer (Int32)}
     */
    static AMAP_PIXELFORMAT_VALID => 1

    /**
     * Indicates that the DirectDraw surface created should also be a Direct3D render target that is created with the <b>DDSCAPS_3DDEVICE</b> flag set.
     * @type {Integer (Int32)}
     */
    static AMAP_3D_TARGET => 2

    /**
     * Indicates that if you can't allocate the DirectDraw surface in video memory you will try to allocate a system memory DirectDraw surface. (Note you should never allocate an AGP memory surface.)
     * @type {Integer (Int32)}
     */
    static AMAP_ALLOW_SYSMEM => 4

    /**
     * Force the surface to be created in system memory. Specify this if you will use GDI to process the image before it is renderered. The surface must match the current monitor display format (pixel depth).
     * @type {Integer (Int32)}
     */
    static AMAP_FORCE_SYSMEM => 8

    /**
     * Means that when Flip is called you should Flip to the specified DirectDraw Surface passed as a parameter to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ivmrimagepresenter-presentimage">PresentImage</a> method in the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ivmrimagepresenter">IVMRImagePresenter</a> interface. Correct support for this flag is crucial in order to keep DXVA buffers seen by a video decoder in sync with the DXVA buffers seen by the graphics driver.
     * @type {Integer (Int32)}
     */
    static AMAP_DIRECTED_FLIP => 16

    /**
     * Indicates that this surface will be used as a DXVA target.
     * @type {Integer (Int32)}
     */
    static AMAP_DXVA_TARGET => 32
}
