#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure contains a firmware image payload to be downloaded to the target.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_hw_firmware_download
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_HW_FIRMWARE_DOWNLOAD {
    #StructPack 8

    /**
     * The version of this structure. This should be set to sizeof(STORAGE_HW_FIRMWARE_DOWNLOAD).
     */
    Version : UInt32

    /**
     * The size of this structure and the download image buffer.
     */
    Size : UInt32

    /**
     * Flags associated with this download. The following are valid flags that this member can hold.
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>STORAGE_HW_FIRMWARE_REQUEST_FLAG_CONTROLLER</td>
     * <td>Indicates that the target of the request is a controller or adapter, different than the device handler or object itself (e.g. NVMe SSD or HBA).</td>
     * </tr>
     * <tr>
     * <td>STORAGE_HW_FIRMWARE_REQUEST_FLAG_LAST_SEGMENT</td>
     * <td>Indicates that the current firmware image segment is the last one.</td>
     * </tr>
     * </table>
     */
    Flags : UInt32

    /**
     * The slot number that the firmware image will be downloaded to.
     */
    Slot : Int8

    /**
     * Reserved for future use.
     */
    Reserved : Int8[3]

    /**
     * The offset in this buffer of where the Image file begins. This should be aligned to <b>ImagePayloadAlignment</b> from <a href="https://docs.microsoft.com/windows/desktop/FileIO/storage-hw-firmware-info">STORAGE_HW_FIRMWARE_INFO</a>.
     */
    Offset : Int64

    /**
     * The buffer size of the ImageBuffer. This should be a multiple of <b>ImagePayloadAlignment</b> from <a href="https://docs.microsoft.com/windows/desktop/FileIO/storage-hw-firmware-info">STORAGE_HW_FIRMWARE_INFO</a>.
     */
    BufferSize : Int64

    /**
     * The firmware image file.
     */
    ImageBuffer : Int8[1]

}
