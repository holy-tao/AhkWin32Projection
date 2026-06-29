#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct VOLUME_CONTROL {
    #StructPack 1

    PortVolume : Int8[4]

}
