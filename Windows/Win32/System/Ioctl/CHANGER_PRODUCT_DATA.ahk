#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents product data for a changer device. It is used by the IOCTL_CHANGER_GET_PRODUCT_DATA control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-changer_product_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CHANGER_PRODUCT_DATA {
    #StructPack 1

    /**
     * The device manufacturer's name. This is acquired directly from the device inquiry data.
     */
    VendorId : Int8[8]

    /**
     * The product identification, as defined by the vendor. This is acquired directly from the device inquiry data.
     */
    ProductId : Int8[16]

    /**
     * The product revision, as defined by the vendor.
     */
    Revision : Int8[4]

    /**
     * A unique value used to globally identify this device, as defined by the vendor.
     */
    SerialNumber : Int8[32]

    /**
     * The device type of data transports, as defined by SCSI-2. This member must be <b>FILE_DEVICE_CHANGER</b>.
     */
    DeviceType : Int8

}
