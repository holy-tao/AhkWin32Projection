#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_DELETE_SYMLINK_INPUT {
    #StructPack 2

    NameOffset : UInt16

    NameLength : UInt16

}
