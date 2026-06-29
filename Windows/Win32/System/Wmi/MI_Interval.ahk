#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * MI_Interval represents an interval of time.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_interval
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_Interval {
    #StructPack 4

    /**
     * The number of days in the interval. (0-99999999)
     */
    days : UInt32

    /**
     * The remaining number of hours in the interval. (0-23)
     */
    hours : UInt32

    /**
     * The remaining number of minutes in the interval. (0-59)
     */
    minutes : UInt32

    /**
     * The remaining number of seconds in the interval. (0-59)
     */
    seconds : UInt32

    /**
     * The remaining number of microseconds in the interval. (0-999999)
     */
    microseconds : UInt32

    /**
     * Reserved. The <b>MI_Interval</b> structure is padded to have the same size as <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a>.
     */
    __padding1 : UInt32

    /**
     * Reserved. The <b>MI_Interval</b> structure is padded to have the same size as <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a>.
     */
    __padding2 : UInt32

    /**
     * Reserved. The <b>MI_Interval</b> structure is padded to have the same size as <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_timestamp">MI_Timestamp</a>.
     */
    __padding3 : UInt32

}
