#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDSURFACEDATA structure is used by DirectDraw to represent a surface to the kernel-mode miniport driver.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddsurfacedata
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDSURFACEDATA extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff550286(v=vs.85)">DDSCAPS</a> structure that contains the creation capabilities used to describe the surface.
     * @type {Integer}
     */
    ddsCaps {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the byte offset from the beginning of the frame buffer to the start of the surface. This field is used only by the miniport driver.
     * @type {Integer}
     */
    dwSurfaceOffset {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Points to the start of the surface.
     * @type {Pointer}
     */
    fpLockPtr {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Specifies the surface width, in pixels.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Specifies the surface height, in pixels.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Specifies the surface pitch, in bytes.
     * @type {Integer}
     */
    lPitch {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwOverlayFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Specifies the byte offset from the beginning of the frame buffer to the start of the overlay. This field is used only by the miniport driver.
     * @type {Integer}
     */
    dwOverlayOffset {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Specifies the overlay source width, in pixels. This field is used only by the miniport driver.
     * @type {Integer}
     */
    dwOverlaySrcWidth {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Specifies the overlay source height, in pixels. This field is used only by the miniport driver.
     * @type {Integer}
     */
    dwOverlaySrcHeight {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Specifies the overlay destination width, in pixels. This field is used only by the miniport driver.
     * @type {Integer}
     */
    dwOverlayDestWidth {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Specifies the overlay destination height, in pixels. This field is used only by the miniport driver.
     * @type {Integer}
     */
    dwOverlayDestHeight {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * If this surface is being fed by a <a href="https://docs.microsoft.com/windows-hardware/drivers/">video port extensions (VPE)</a> object, this field indicates the ID of the VPE object, an integer in the range (0 - (maximum number of hardware video ports -1 )); otherwise, this field is -1.
     * @type {Integer}
     */
    dwVideoPortId {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    dwFormatFlags {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Specifies the <a href="https://docs.microsoft.com/windows-hardware/drivers/">FOURCC</a> code.
     * @type {Integer}
     */
    dwFormatFourCC {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Specifies the number of bits per pixel (4, 8, 16, 24, or 32).
     * @type {Integer}
     */
    dwFormatBitCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Specifies the red bitmask.
     * @type {Integer}
     */
    dwRBitMask {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies the green bitmask.
     * @type {Integer}
     */
    dwGBitMask {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Specifies the blue bitmask.
     * @type {Integer}
     */
    dwBBitMask {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Reserved for the HAL/Miniport
     * @type {Integer}
     */
    dwDriverReserved1 {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Reserved for the HAL/Miniport
     * @type {Integer}
     */
    dwDriverReserved2 {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * Reserved for the HAL/Miniport
     * @type {Integer}
     */
    dwDriverReserved3 {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Are reserved for use by the miniport driver.
     * @type {Integer}
     */
    dwDriverReserved4 {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }
}
