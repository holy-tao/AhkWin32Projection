#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_RECORDING_MANAGEMENT_AREA_DATA {
    #StructPack 1

    LastRecordedRMASectorNumber : Int8[4]

    RMDBytes : Int8[1]

}
