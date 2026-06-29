#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CSV_QUERY_FILE_REVISION_ECP_CONTEXT_FILE_ID_128 {
    #StructPack 8

    FileId : IntPtr

    FileRevision : Int64[3]

}
