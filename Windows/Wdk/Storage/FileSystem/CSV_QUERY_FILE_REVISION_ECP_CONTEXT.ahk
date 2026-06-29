#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct CSV_QUERY_FILE_REVISION_ECP_CONTEXT {
    #StructPack 8

    FileId : Int64

    FileRevision : Int64[3]

}
