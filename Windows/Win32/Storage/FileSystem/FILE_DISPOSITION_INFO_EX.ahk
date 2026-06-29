#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_DISPOSITION_INFO_EX_FLAGS.ahk" { FILE_DISPOSITION_INFO_EX_FLAGS }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct FILE_DISPOSITION_INFO_EX {
    #StructPack 4

    Flags : FILE_DISPOSITION_INFO_EX_FLAGS

}
