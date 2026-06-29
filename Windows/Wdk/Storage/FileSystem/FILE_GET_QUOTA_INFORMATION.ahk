#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_GET_QUOTA_INFORMATION {
    #StructPack 8

    NextEntryOffset : UInt32

    SidLength : UInt32

    Sid : IntPtr

}
