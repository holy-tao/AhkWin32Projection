#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_RAM_SPARE_AREA_INFORMATION {
    #StructPack 1

    FreePrimarySpareSectors : Int8[4]

    FreeSupplementalSpareSectors : Int8[4]

    AllocatedSupplementalSpareSectors : Int8[4]

}
