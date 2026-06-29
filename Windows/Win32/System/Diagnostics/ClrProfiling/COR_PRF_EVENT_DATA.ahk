#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_EVENT_DATA {
    #StructPack 8

    ptr : Int64

    size : UInt32

    reserved : UInt32

}
