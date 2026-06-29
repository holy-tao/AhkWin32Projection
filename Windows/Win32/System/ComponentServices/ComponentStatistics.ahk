#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents statistical information about a COM+ component hosted in a particular process.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-componentstatistics
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ComponentStatistics {
    #StructPack 4

    /**
     * The number of instances of the component in the hosting process.
     */
    NumInstances : UInt32

    /**
     * The number of client references bound to an instance of this component.
     */
    NumBoundReferences : UInt32

    /**
     * The number of instances of the component in the hosting process's object pool.
     */
    NumPooledObjects : UInt32

    /**
     * The number of instances of the component that are currently servicing a call.
     */
    NumObjectsInCall : UInt32

    /**
     * A rolling average of the time it takes an instance of this component to service a call.
     */
    AvgResponseTimeInMs : UInt32

    /**
     * The number of calls to instances of this component that have completed (successfully or not) in a recent time period (for comparison with <b>NumCallsFailedRecent</b>).
     */
    NumCallsCompletedRecent : UInt32

    /**
     * The number of calls to instances of this component that have failed in a recent time period (for comparison with <b>NumCallsCompletedRecent</b>).
     */
    NumCallsFailedRecent : UInt32

    /**
     * The total number of calls to instances of this component that have completed (successfully or not) throughout the lifetime of the hosting process. This data is not currently available, and this member is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     */
    NumCallsCompletedTotal : UInt32

    /**
     * The total number of calls to instances of this component that have failed throughout the lifetime of the hosting process. This data is not currently available, and this member is always set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     */
    NumCallsFailedTotal : UInt32

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     */
    Reserved1 : UInt32

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     */
    Reserved2 : UInt32

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     */
    Reserved3 : UInt32

    /**
     * This member is reserved and set to DATA_NOT_AVAILABLE (0xFFFFFFFF).
     */
    Reserved4 : UInt32

}
