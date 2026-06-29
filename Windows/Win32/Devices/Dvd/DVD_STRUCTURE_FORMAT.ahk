#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_STRUCTURE_FORMAT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static DvdPhysicalDescriptor => 0

    /**
     * @type {Integer (Int32)}
     */
    static DvdCopyrightDescriptor => 1

    /**
     * @type {Integer (Int32)}
     */
    static DvdDiskKeyDescriptor => 2

    /**
     * @type {Integer (Int32)}
     */
    static DvdBCADescriptor => 3

    /**
     * @type {Integer (Int32)}
     */
    static DvdManufacturerDescriptor => 4

    /**
     * @type {Integer (Int32)}
     */
    static DvdMaxDescriptor => 5
}
