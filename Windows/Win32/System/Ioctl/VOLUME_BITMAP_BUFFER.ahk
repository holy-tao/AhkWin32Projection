#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the occupied and available clusters on a disk.
 * @remarks
 * 
 * The <b>BitmapSize</b> member is the number of clusters on the volume starting from the starting LCN returned in the <b>StartingLcn</b> member of this structure. For example, suppose there are 0xD3F7 clusters on the volume. If you start the bitmap query at LCN 0xA007, then both the FAT and NTFS file systems will round down the returned starting LCN to LCN 0xA000. The value returned in the <b>BitmapSize</b> member will be (0xD3F7 – 0xA000), or 0x33F7.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-volume_bitmap_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class VOLUME_BITMAP_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Starting LCN requested as an input to the operation.
     * @type {Integer}
     */
    StartingLcn {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The number of clusters on the volume, starting from the starting LCN returned in the <b>StartingLcn</b> member of this structure. See the following Remarks section for details.
     * @type {Integer}
     */
    BitmapSize {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * Array of bytes containing the bitmap that the operation returns. The bitmap is bitwise from bit zero of the bitmap to the end. Thus, starting at the requested cluster, the bitmap goes from bit 0 of byte 0, bit 1 of byte 0 ... bit 7 of byte 0, bit 0 of byte 1, and so on. The value 1 indicates that the cluster is allocated (in use). The value 0 indicates that the cluster is not allocated (free).
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
