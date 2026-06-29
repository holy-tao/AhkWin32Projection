#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_BD_SPARE_AREA_INFORMATION {
    #StructPack 1

    Reserved1 : Int8[4]

    NumberOfFreeSpareBlocks : Int8[4]

    NumberOfAllocatedSpareBlocks : Int8[4]

}
