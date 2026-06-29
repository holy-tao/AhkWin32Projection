#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_INTERCEPT_COUNTER {
    #StructPack 8

    Count : Int64

    Time100ns : Int64

}
