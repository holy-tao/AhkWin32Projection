#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDSURFACEDATA structure is used by DirectDraw to represent a surface to the kernel-mode miniport driver.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddsurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDSURFACEDATA {
    #StructPack 8

    /**
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that contains the creation capabilities used to describe the surface.
     */
    ddsCaps : UInt32

    /**
     * Specifies the byte offset from the beginning of the frame buffer to the start of the surface. This field is used only by the miniport driver.
     */
    dwSurfaceOffset : UInt32

    /**
     * Points to the start of the surface.
     */
    fpLockPtr : IntPtr

    /**
     * Specifies the surface width, in pixels.
     */
    dwWidth : UInt32

    /**
     * Specifies the surface height, in pixels.
     */
    dwHeight : UInt32

    /**
     * Specifies the surface pitch, in bytes.
     */
    lPitch : Int32

    dwOverlayFlags : UInt32

    /**
     * Specifies the byte offset from the beginning of the frame buffer to the start of the overlay. This field is used only by the miniport driver.
     */
    dwOverlayOffset : UInt32

    /**
     * Specifies the overlay source width, in pixels. This field is used only by the miniport driver.
     */
    dwOverlaySrcWidth : UInt32

    /**
     * Specifies the overlay source height, in pixels. This field is used only by the miniport driver.
     */
    dwOverlaySrcHeight : UInt32

    /**
     * Specifies the overlay destination width, in pixels. This field is used only by the miniport driver.
     */
    dwOverlayDestWidth : UInt32

    /**
     * Specifies the overlay destination height, in pixels. This field is used only by the miniport driver.
     */
    dwOverlayDestHeight : UInt32

    /**
     * If this surface is being fed by a <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object, this field indicates the ID of the VPE object, an integer in the range (0 - (maximum number of hardware video ports -1 )); otherwise, this field is -1.
     */
    dwVideoPortId : UInt32

    dwFormatFlags : UInt32

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows-hardware/drivers/">FOURCC</a> code.
     */
    dwFormatFourCC : UInt32

    /**
     * Specifies the number of bits per pixel (4, 8, 16, 24, or 32).
     */
    dwFormatBitCount : UInt32

    /**
     * Specifies the red bitmask.
     */
    dwRBitMask : UInt32

    /**
     * Specifies the green bitmask.
     */
    dwGBitMask : UInt32

    /**
     * Specifies the blue bitmask.
     */
    dwBBitMask : UInt32

    /**
     * Reserved for the HAL/Miniport
     */
    dwDriverReserved1 : UInt32

    /**
     * Reserved for the HAL/Miniport
     */
    dwDriverReserved2 : UInt32

    /**
     * Reserved for the HAL/Miniport
     */
    dwDriverReserved3 : UInt32

    /**
     * Are reserved for use by the miniport driver.
     */
    dwDriverReserved4 : UInt32

}
