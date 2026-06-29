#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_MANUFACTURER_DESCRIPTOR {
    #StructPack 1

    ManufacturingInformation : Int8[2048]

}
