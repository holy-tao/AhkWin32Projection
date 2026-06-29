#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct HAL_ERROR_INFO {
    #StructPack 8

    Version : UInt32

    InitMaxSize : UInt32

    McaMaxSize : UInt32

    McaPreviousEventsCount : UInt32

    McaCorrectedEventsCount : UInt32

    McaKernelDeliveryFails : UInt32

    McaDriverDpcQueueFails : UInt32

    McaReserved : UInt32

    CmcMaxSize : UInt32

    CmcPollingInterval : UInt32

    CmcInterruptsCount : UInt32

    CmcKernelDeliveryFails : UInt32

    CmcDriverDpcQueueFails : UInt32

    CmcGetStateFails : UInt32

    CmcClearStateFails : UInt32

    CmcReserved : UInt32

    CmcLogId : Int64

    CpeMaxSize : UInt32

    CpePollingInterval : UInt32

    CpeInterruptsCount : UInt32

    CpeKernelDeliveryFails : UInt32

    CpeDriverDpcQueueFails : UInt32

    CpeGetStateFails : UInt32

    CpeClearStateFails : UInt32

    CpeInterruptSources : UInt32

    CpeLogId : Int64

    KernelReserved : Int64[4]

}
