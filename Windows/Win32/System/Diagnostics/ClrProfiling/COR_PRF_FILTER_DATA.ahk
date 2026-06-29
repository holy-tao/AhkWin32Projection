#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 */
export default struct COR_PRF_FILTER_DATA {
    #StructPack 8

    Ptr : Int64

    Size : UInt32

    Type : UInt32

}
