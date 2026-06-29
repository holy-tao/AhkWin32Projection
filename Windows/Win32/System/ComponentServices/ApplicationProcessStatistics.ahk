#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents statistical information about a process hosting COM+ applications.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-applicationprocessstatistics
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ApplicationProcessStatistics {
    #StructPack 4

    /**
     * The number of calls currently outstanding in tracked components in the process.
     */
    NumCallsOutstanding : UInt32

    /**
     * The number of distinct tracked components instantiated in the process.
     */
    NumTrackedComponents : UInt32

    /**
     * The number of component instances in the process.
     */
    NumComponentInstances : UInt32

    /**
     * A rolling average of the number of calls this process is servicing per second.
     */
    AvgCallsPerSecond : UInt32

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
