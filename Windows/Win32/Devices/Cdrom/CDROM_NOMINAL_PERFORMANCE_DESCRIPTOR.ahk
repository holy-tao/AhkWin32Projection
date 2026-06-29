#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_NOMINAL_PERFORMANCE_DESCRIPTOR {
    #StructPack 1

    StartLba : Int8[4]

    StartPerformance : Int8[4]

    EndLba : Int8[4]

    EndPerformance : Int8[4]

}
