#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct IO_STOP_ON_SYMLINK_FILTER_ECP_v0 {
    #StructPack 4


    struct _Out {
        ReparseCount : UInt32

        RemainingPathLength : UInt32

    }

    Out : IO_STOP_ON_SYMLINK_FILTER_ECP_v0._Out

}
