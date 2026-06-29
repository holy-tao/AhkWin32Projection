#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_EXTENT.ahk" { FILE_EXTENT }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VOLUME_CRITICAL_IO {
    #StructPack 8

    AccessType : UInt32

    ExtentsCount : UInt32

    Extents : FILE_EXTENT[1]

}
