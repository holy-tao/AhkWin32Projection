#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_KNOWN_FOLDER_TYPE.ahk" { FILE_KNOWN_FOLDER_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_KNOWN_FOLDER_INFORMATION {
    #StructPack 4

    Type : FILE_KNOWN_FOLDER_TYPE

}
