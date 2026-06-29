#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_READ_PLEX_INPUT {
    #StructPack 8

    ByteOffset : Int64

    Length : UInt32

    PlexNumber : UInt32

}
