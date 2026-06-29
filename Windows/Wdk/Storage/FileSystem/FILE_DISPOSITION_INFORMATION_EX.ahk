#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_DISPOSITION_INFORMATION_EX_FLAGS.ahk" { FILE_DISPOSITION_INFORMATION_EX_FLAGS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_DISPOSITION_INFORMATION_EX {
    #StructPack 4

    Flags : FILE_DISPOSITION_INFORMATION_EX_FLAGS

}
