#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FILE_FULL_EA_INFORMATION.ahk" { FILE_FULL_EA_INFORMATION }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct QUERY_ON_CREATE_EA_INFORMATION {
    #StructPack 8

    EaBufferSize : UInt32

    EaBuffer : FILE_FULL_EA_INFORMATION.Ptr

}
