#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_EVENT_COUNTERS {
    #StructPack 8

    PageFaultCount : Int64

    ExceptionCount : Int64

    InterruptCount : Int64

}
