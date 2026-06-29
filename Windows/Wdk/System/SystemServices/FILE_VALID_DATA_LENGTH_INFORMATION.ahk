#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct FILE_VALID_DATA_LENGTH_INFORMATION {
    #StructPack 8

    ValidDataLength : Int64

}
