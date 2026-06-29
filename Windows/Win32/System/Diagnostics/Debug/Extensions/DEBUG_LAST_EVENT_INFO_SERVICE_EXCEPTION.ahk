#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_LAST_EVENT_INFO_SERVICE_EXCEPTION {
    #StructPack 8

    Kind : UInt32

    DataSize : UInt32

    Address : Int64

}
