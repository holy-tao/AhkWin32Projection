#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectSound
 */
export default struct DSCCAPS {
    #StructPack 4

    dwSize : UInt32

    dwFlags : UInt32

    dwFormats : UInt32

    dwChannels : UInt32

}
