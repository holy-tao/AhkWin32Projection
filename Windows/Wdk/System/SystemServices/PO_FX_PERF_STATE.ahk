#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_PERF_STATE {
    #StructPack 8

    Value : Int64

    Context : IntPtr

}
