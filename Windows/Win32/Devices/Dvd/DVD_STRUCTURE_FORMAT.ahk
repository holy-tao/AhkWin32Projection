#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_STRUCTURE_FORMAT extends Win32Enum{

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
