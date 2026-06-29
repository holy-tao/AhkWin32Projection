#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WHV_PROCESSOR_INTERCEPT_COUNTER.ahk" { WHV_PROCESSOR_INTERCEPT_COUNTER }

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_PROCESSOR_INTERCEPT_COUNTERS {
    #StructPack 8

    PageInvalidations : WHV_PROCESSOR_INTERCEPT_COUNTER

    ControlRegisterAccesses : WHV_PROCESSOR_INTERCEPT_COUNTER

    IoInstructions : WHV_PROCESSOR_INTERCEPT_COUNTER

    HaltInstructions : WHV_PROCESSOR_INTERCEPT_COUNTER

    CpuidInstructions : WHV_PROCESSOR_INTERCEPT_COUNTER

    MsrAccesses : WHV_PROCESSOR_INTERCEPT_COUNTER

    OtherIntercepts : WHV_PROCESSOR_INTERCEPT_COUNTER

    PendingInterrupts : WHV_PROCESSOR_INTERCEPT_COUNTER

    EmulatedInstructions : WHV_PROCESSOR_INTERCEPT_COUNTER

    DebugRegisterAccesses : WHV_PROCESSOR_INTERCEPT_COUNTER

    PageFaultIntercepts : WHV_PROCESSOR_INTERCEPT_COUNTER

    NestedPageFaultIntercepts : WHV_PROCESSOR_INTERCEPT_COUNTER

    Hypercalls : WHV_PROCESSOR_INTERCEPT_COUNTER

    RdpmcInstructions : WHV_PROCESSOR_INTERCEPT_COUNTER

}
