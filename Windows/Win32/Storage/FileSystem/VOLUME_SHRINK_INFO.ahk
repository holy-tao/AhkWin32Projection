#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_SHRINK_INFO {
    #StructPack 8

    VolumeSize : Int64

}
