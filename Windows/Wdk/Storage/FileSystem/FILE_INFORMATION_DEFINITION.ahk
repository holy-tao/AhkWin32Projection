#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_INFORMATION_CLASS.ahk" { FILE_INFORMATION_CLASS }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_INFORMATION_DEFINITION {
    #StructPack 4

    Class : FILE_INFORMATION_CLASS

    NextEntryOffset : UInt32

    FileNameLengthOffset : UInt32

    FileNameOffset : UInt32

}
