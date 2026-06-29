#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct SUB_Q_HEADER {
    #StructPack 1

    Reserved : Int8

    AudioStatus : Int8

    DataLength : Int8[2]

}
