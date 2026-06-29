#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DVD_STRUCTURE_FORMAT.ahk" { DVD_STRUCTURE_FORMAT }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct DVD_READ_STRUCTURE {
    #StructPack 8

    BlockByteOffset : Int64

    Format : DVD_STRUCTURE_FORMAT

    SessionId : UInt32

    LayerNumber : Int8

}
