#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_END_OF_FILE_INFORMATION {
    #StructPack 8

    EndOfFile : Int64

}
