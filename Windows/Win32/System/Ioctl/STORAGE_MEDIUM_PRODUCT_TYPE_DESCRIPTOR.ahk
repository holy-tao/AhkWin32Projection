#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY request to describe the product type of a storage device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_medium_product_type_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes, as defined by <c>Sizeof(STORAGE_MEDIUM_PRODUCT_TYPE_DESCRIPTOR)</c>. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

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
     */
    MediumProductType : UInt32

}
