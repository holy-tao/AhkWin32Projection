#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Reserved for future use. (STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_attributes_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR {
    #StructPack 8

    /**
     * Contains the version of the data reported.
     */
    Version : UInt32

    /**
     * Indicates the quantity of data reported, in bytes. This is the <c>sizeof(STORAGE_DEVICE_ATTRIBUTES_DESCRIPTOR)</c>.
     */
    Size : UInt32

    /**
     * Reserved for future use.
     */
    Attributes : Int64

}
