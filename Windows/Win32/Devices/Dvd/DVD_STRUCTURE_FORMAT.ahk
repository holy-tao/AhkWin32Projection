#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
class DVD_STRUCTURE_FORMAT extends Win32Enum {

    /**
     * Native name: DvdPhysicalDescriptor
     * @type {Integer (Int32)}
     */
    static PhysicalDescriptor => 0

    /**
     * Native name: DvdCopyrightDescriptor
     * @type {Integer (Int32)}
     */
    static CopyrightDescriptor => 1

    /**
     * Native name: DvdDiskKeyDescriptor
     * @type {Integer (Int32)}
     */
    static DiskKeyDescriptor => 2

    /**
     * @type {Integer (Int32)}
     */
    static DvdBCADescriptor => 3

    /**
     * Native name: DvdManufacturerDescriptor
     * @type {Integer (Int32)}
     */
    static ManufacturerDescriptor => 4

    /**
     * Native name: DvdMaxDescriptor
     * @type {Integer (Int32)}
     */
    static MaxDescriptor => 5
}
