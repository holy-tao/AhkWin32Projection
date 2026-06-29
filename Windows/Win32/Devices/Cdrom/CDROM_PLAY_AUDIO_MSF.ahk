#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Cdrom
 */
export default struct CDROM_PLAY_AUDIO_MSF {
    #StructPack 1

    StartingM : Int8

    StartingS : Int8

    StartingF : Int8

    EndingM : Int8

    EndingS : Int8

    EndingF : Int8

}
