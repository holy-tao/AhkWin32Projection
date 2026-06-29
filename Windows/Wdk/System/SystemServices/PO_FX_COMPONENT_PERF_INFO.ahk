#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PO_FX_COMPONENT_PERF_INFO {
    #StructPack 8

    PerfStateSetsCount : UInt32

    PerfStateSets : IntPtr[1]

}
