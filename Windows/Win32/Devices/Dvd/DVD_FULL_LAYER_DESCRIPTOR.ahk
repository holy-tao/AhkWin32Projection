#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_LAYER_DESCRIPTOR.ahk" { DVD_LAYER_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_FULL_LAYER_DESCRIPTOR {
    #StructPack 4

    commonHeader : DVD_LAYER_DESCRIPTOR

    MediaSpecific : Int8[2031]

}
