#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEQUEUEINFO structure provides information about a queue on a line device. The lineGetQueueInfo function returns the LINEQUEUEINFO structure. This structure requires TAPI 3.0 version negotiation.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linequeueinfo
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEQUEUEINFO extends Win32Struct
{
    static sizeof => 52

    static packingSize => 1

    /**
     * Total size allocated to this structure, in bytes.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size needed to hold all the information requested, in bytes.
     * @type {Integer}
     */
    dwNeededSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size of the portion of this structure that contains useful information, in bytes.
     * @type {Integer}
     */
    dwUsedSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Period for which the switch or implementation stores and calculates information, in seconds. For example, <b>dwTotalCallsAbandoned</b> holds the number of abandoned calls; <b>dwMeasurementPeriod</b> would indicate if this value referenced the calls queued in an hour, day, or month, for example.
     * @type {Integer}
     */
    dwMeasurementPeriod {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Total number of incoming calls for this queue during this measurement period.
     * @type {Integer}
     */
    dwTotalCallsQueued {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of incoming calls currently waiting.
     * @type {Integer}
     */
    dwCurrentCallsQueued {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of abandoned calls during this measurement period.
     * @type {Integer}
     */
    dwTotalCallsAbandoned {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Total number of calls that flowed into this queue (passed down from another queue or ACD group) during this measurement period.
     * @type {Integer}
     */
    dwTotalCallsFlowedIn {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Total number of calls that flowed out of this queue (passed down to another queue or ACD group) during this measurement period.
     * @type {Integer}
     */
    dwTotalCallsFlowedOut {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Longest time any call has waited in queue, in seconds.
     * @type {Integer}
     */
    dwLongestEverWaitTime {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * Longest time that a current call (call still in queue) has been waiting, in seconds.
     * @type {Integer}
     */
    dwCurrentLongestWaitTime {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Average time that a call has waited in queue, in seconds.
     * @type {Integer}
     */
    dwAverageWaitTime {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * Final disposition of the queue.
     * @type {Integer}
     */
    dwFinalDisposition {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
