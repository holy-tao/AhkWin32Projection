#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY request to describe the product type of a storage device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_medium_product_type_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes, as defined by <c>Sizeof(STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR)</c>. The value of this member will change as members are added to 
     *       the structure.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the product type of the storage device.
     * 
     * <table>
     * <tr>
     * <th><b>MediumProductType</b> value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><c>00h</c></td>
     * <td>Not indicated</td>
     * </tr>
     * <tr>
     * <td><c>01h</c></td>
     * <td>CFast</td>
     * </tr>
     * <tr>
     * <td><c>02h</c></td>
     * <td>CompactFlash</td>
     * </tr>
     * <tr>
     * <td><c>03h</c></td>
     * <td>Memory Stick</td>
     * </tr>
     * <tr>
     * <td><c>04h</c></td>
     * <td>MultiMediaCard</td>
     * </tr>
     * <tr>
     * <td><c>05h</c></td>
     * <td>Secure Digital Card (SD Card)</td>
     * </tr>
     * <tr>
     * <td><c>06h</c></td>
     * <td>QXD</td>
     * </tr>
     * <tr>
     * <td><c>07h</c></td>
     * <td>Universal Flash Storage</td>
     * </tr>
     * <tr>
     * <td><c>08h</code> to <code>EFh</c></td>
     * <td>Reserved</td>
     * </tr>
     * <tr>
     * <td><c>F0h</code> to <code>FFh</c></td>
     * <td>Vendor-specific</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    MediumProductType {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
