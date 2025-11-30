#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the values that specify the type of time stamp to use when logging events channel.
 * @see https://docs.microsoft.com/windows/win32/api//winevt/ne-winevt-evt_channel_clock_type
 * @namespace Windows.Win32.System.EventLog
 * @version v4.0.30319
 */
class EVT_CHANNEL_CLOCK_TYPE extends Win32Enum{

    /**
     * Uses the system time for the time stamp. The system time provides a low-resolution (10 milliseconds) time stamp but is comparatively less expensive to retrieve. System time is the default. 
     * 
     * Note that if the volume of events is high, the resolution for system time may not be fine enough to determine the sequence of events. If multiple events contain the same time stamp, the events may be delivered in the wrong order.
     * @type {Integer (Int32)}
     */
    static EvtChannelClockTypeSystemTime => 0

    /**
     * Uses the query performance counter (QPC) for the time stamp. The QPC time stamp provides a high-resolution (100 nanoseconds) time stamp but is comparatively more expensive to retrieve. 
     * 
     * You should use this resolution if you have high event rates or if the consumer merges events from different buffers.
     * 
     * Note that on older computers, the time stamp may not be accurate because the counter sometimes skips forward due to hardware errors.
     * @type {Integer (Int32)}
     */
    static EvtChannelClockTypeQPC => 1
}
