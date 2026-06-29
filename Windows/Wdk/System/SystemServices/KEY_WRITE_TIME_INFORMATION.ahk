#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KEY_WRITE_TIME_INFORMATION {
    #StructPack 8

    LastWriteTime : Int64

}
