#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct STORAGE_SET_READ_AHEAD {
    #StructPack 8

    TriggerAddress : Int64

    TargetAddress : Int64

}
