#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_RUNTIME_COUNTERS {
    #StructPack 8

    TotalRuntime100ns : Int64

    HypervisorRuntime100ns : Int64

}
