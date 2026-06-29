#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_PIPE_CREATE_SYMLINK_INPUT {
    #StructPack 4

    NameOffset : UInt16

    NameLength : UInt16

    SubstituteNameOffset : UInt16

    SubstituteNameLength : UInt16

    Flags : UInt32

}
