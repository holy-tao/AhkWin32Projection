#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEQUEUEINFO structure provides information about a queue on a line device. The lineGetQueueInfo function returns the LINEQUEUEINFO structure. This structure requires TAPI 3.0 version negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linequeueinfo
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEQUEUEINFO {
    #StructPack 4

    /**
     * Total size allocated to this structure, in bytes.
     */
    dwTotalSize : UInt32

    /**
     * Size needed to hold all the information requested, in bytes.
     */
    dwNeededSize : UInt32

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     */
    dwUsedSize : UInt32

    /**
     * Period for which the switch or implementation stores and calculates information, in seconds. For example, <b>dwTotalCallsAbandoned</b> holds the number of abandoned calls; <b>dwMeasurementPeriod</b> would indicate if this value referenced the calls queued in an hour, day, or month, for example.
     */
    dwMeasurementPeriod : UInt32

    /**
     * Total number of incoming calls for this queue during this measurement period.
     */
    dwTotalCallsQueued : UInt32

    /**
     * Number of incoming calls currently waiting.
     */
    dwCurrentCallsQueued : UInt32

    /**
     * Number of abandoned calls during this measurement period.
     */
    dwTotalCallsAbandoned : UInt32

    /**
     * Total number of calls that flowed into this queue (passed down from another queue or ACD group) during this measurement period.
     */
    dwTotalCallsFlowedIn : UInt32

    /**
     * Total number of calls that flowed out of this queue (passed down to another queue or ACD group) during this measurement period.
     */
    dwTotalCallsFlowedOut : UInt32

    /**
     * Longest time any call has waited in queue, in seconds.
     */
    dwLongestEverWaitTime : UInt32

    /**
     * Longest time that a current call (call still in queue) has been waiting, in seconds.
     */
    dwCurrentLongestWaitTime : UInt32

    /**
     * Average time that a call has waited in queue, in seconds.
     */
    dwAverageWaitTime : UInt32

    /**
     * Final disposition of the queue.
     */
    dwFinalDisposition : UInt32

}
