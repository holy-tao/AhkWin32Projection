#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESS_NETWORK_COUNTERS {
    #StructPack 8

    BytesIn : Int64

    BytesOut : Int64

}
