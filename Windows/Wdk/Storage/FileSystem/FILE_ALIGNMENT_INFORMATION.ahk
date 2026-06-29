#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct FILE_ALIGNMENT_INFORMATION {
    #StructPack 4

    AlignmentRequirement : UInt32

}
