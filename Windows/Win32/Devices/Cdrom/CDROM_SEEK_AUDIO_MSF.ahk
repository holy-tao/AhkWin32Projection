#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_SEEK_AUDIO_MSF {
    #StructPack 1

    M : Int8

    S : Int8

    F : Int8

}
