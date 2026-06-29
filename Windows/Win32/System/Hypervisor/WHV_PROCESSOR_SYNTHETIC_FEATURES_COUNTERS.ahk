#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_SYNTHETIC_FEATURES_COUNTERS {
    #StructPack 8

    SyntheticInterruptsCount : Int64

    LongSpinWaitHypercallsCount : Int64

    OtherHypercallsCount : Int64

    SyntheticInterruptHypercallsCount : Int64

    VirtualInterruptHypercallsCount : Int64

    VirtualMmuHypercallsCount : Int64

}
