#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct AACS_SERIAL_NUMBER {
    #StructPack 1

    PrerecordedSerialNumber : Int8[16]

    MAC : Int8[16]

}
