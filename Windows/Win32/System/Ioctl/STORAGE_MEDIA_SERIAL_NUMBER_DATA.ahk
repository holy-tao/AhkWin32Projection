#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_MEDIA_SERIAL_NUMBER_DATA {
    #StructPack 2

    Reserved : UInt16

    SerialNumberLength : UInt16

    SerialNumber : Int8[1]

}
