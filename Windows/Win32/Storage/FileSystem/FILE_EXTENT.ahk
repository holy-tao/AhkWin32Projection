#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_EXTENT {
    #StructPack 8

    VolumeOffset : Int64

    ExtentLength : Int64

}
