#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SIZE.ahk

/**
 * The SURFOBJ structure is the user object for a surface. A device driver usually calls methods on a surface object only when the surface object represents a GDI bitmap or a device-managed surface.
 * @remarks
 * When information about a particular surface is required by a driver, the driver must access the SURFOBJ. This structure allows quick access to the properties of the surface.
  * 
  * When a SURFOBJ structure represents a GDI bitmap, the driver must be able to determine the format of the bitmap and locate the bitmap bits.
  * 
  * When a SURFOBJ structure represents a device surface, the driver must be able to locate the device handle for the surface.
  * 
  * For more information about supporting JPEG and PNG compressed images, see <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-devinfo">DEVINFO</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-surfobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class SURFOBJ extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Handle to a surface, provided that the surface is device-managed. Otherwise, this member is zero.
     * @type {Pointer<DHSURF>}
     */
    dhsurf {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Handle to the surface.
     * @type {Pointer<HSURF>}
     */
    hsurf {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Identifies the device's <a href="https://docs.microsoft.com/windows-hardware/drivers/">PDEV</a> that is associated with the specified surface.
     * @type {Pointer<DHPDEV>}
     */
    dhpdev {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * GDI's logical handle to the PDEV associated with this device.
     * @type {Pointer<HDEV>}
     */
    hdev {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Specifies a SIZEL structure that contains the width and height, in pixels, of the surface. The SIZEL structure is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-size">SIZE</a> structure.
     * @type {SIZE}
     */
    sizlBitmap{
        get {
            if(!this.HasProp("__sizlBitmap"))
                this.__sizlBitmap := SIZE(this.ptr + 32)
            return this.__sizlBitmap
        }
    }

    /**
     * Specifies the size of the buffer pointed to by <b>pvBits</b>.
     * @type {Integer}
     */
    cjBits {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * If the surface is a standard format bitmap, this is a pointer to the surface's pixels. For BMF_JPEG or BMF_PNG images, this is a pointer to a buffer containing the image data in a JPEG or PNG format. Otherwise, this member is <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvBits {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Pointer to the first scan line of the bitmap. If <b>iBitmapFormat</b> is BMF_JPEG or BMF_PNG, this member is <b>NULL</b>.
     * @type {Pointer<Void>}
     */
    pvScan0 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Specifies the count of bytes required to move down one scan line in the bitmap. If <b>iBitmapFormat</b> is BMF_JPEG or BMF_PNG, this member is <b>NULL</b>.
     * @type {Integer}
     */
    lDelta {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Specifies the current state of the specified surface. Every time the surface changes, this value is incremented. This enables drivers to cache source surfaces.
     * 
     * For a surface that should not be cached, <b>iUniq</b> is set to zero. This value is used in conjunction with the BMF_DONTCACHE flag of <b>fjBitmap</b>.
     * @type {Integer}
     */
    iUniq {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Specifies the standard format most closely matching this surface. If the <b>iType</b> member specifies a bitmap (STYPE_BITMAP), this member specifies its format. NT-based operating systems support a set of predefined formats, although applications can also send device-specific formats by using <b>SetDIBitsToDevice</b>. Supported predefined formats include the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * BMF_1BPP
     * 
     * </td>
     * <td>
     * 1 bit per pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_4BPP
     * 
     * </td>
     * <td>
     * 4 bits per pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_8BPP
     * 
     * </td>
     * <td>
     * 8 bits per pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_16BPP
     * 
     * </td>
     * <td>
     * 16 bits per pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_24BPP
     * 
     * </td>
     * <td>
     * 24 bits per pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_32BPP
     * 
     * </td>
     * <td>
     * 32 bits per pixel.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_4RLE
     * 
     * </td>
     * <td>
     * 4 bits per pixel, run length encoded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_8RLE
     * 
     * </td>
     * <td>
     * 8 bits per pixel, run length encoded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_JPEG
     * 
     * </td>
     * <td>
     * JPEG compressed image.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_PNG
     * 
     * </td>
     * <td>
     * PNG compressed image.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iBitmapFormat {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Surface type, which is one of the following:
     * 
     * <table>
     * <tr>
     * <th>Type</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * STYPE_BITMAP
     * 
     * </td>
     * <td>
     * The surface is a bitmap.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * STYPE_DEVBITMAP
     * 
     * </td>
     * <td>
     * The surface is a device format bitmap.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * STYPE_DEVICE
     * 
     * </td>
     * <td>
     * The surface is managed by the device.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iType {
        get => NumGet(this, 76, "ushort")
        set => NumPut("ushort", value, this, 76)
    }

    /**
     * If the surface is of type STYPE_BITMAP and is a standard uncompressed format bitmap, the following flags can be set. Otherwise, this member should be ignored.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>
     * BMF_DONTCACHE
     * 
     * </td>
     * <td>
     * The bitmap should not be cached by the driver because it is a transient bitmap, created by GDI, that the driver will never see again. If this flag is set, the <b>iUniq</b> member of this structure will be set to 0.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_KMSECTION
     * 
     * </td>
     * <td>
     * Is used by GDI only and should be ignored by the driver. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_NOTSYSMEM
     * 
     * </td>
     * <td>
     * The bitmap is not in system memory. <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-engmodifysurface">EngModifySurface</a> sets this flag when it moves a bitmap into video memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_NOZEROINIT
     * 
     * </td>
     * <td>
     * The bitmap was not zero-initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_TOPDOWN
     * 
     * </td>
     * <td>
     * The first scan line represents the <i>top</i> of the bitmap.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * BMF_WINDOW_BLT
     * 
     * </td>
     * <td>
     * GDI sets this flag to notify the driver of a window move from one screen location to another.  
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    fjBitmap {
        get => NumGet(this, 78, "ushort")
        set => NumPut("ushort", value, this, 78)
    }
}
