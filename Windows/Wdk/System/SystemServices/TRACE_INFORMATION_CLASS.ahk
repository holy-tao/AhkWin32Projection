#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TRACE_INFORMATION_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static TraceIdClass => 0

    /**
     * @type {Integer (Int32)}
     */
    static TraceHandleClass => 1

    /**
     * @type {Integer (Int32)}
     */
    static TraceEnableFlagsClass => 2

    /**
     * @type {Integer (Int32)}
     */
    static TraceEnableLevelClass => 3

    /**
     * @type {Integer (Int32)}
     */
    static GlobalLoggerHandleClass => 4

    /**
     * @type {Integer (Int32)}
     */
    static EventLoggerHandleClass => 5

    /**
     * @type {Integer (Int32)}
     */
    static AllLoggerHandlesClass => 6

    /**
     * @type {Integer (Int32)}
     */
    static TraceHandleByNameClass => 7

    /**
     * @type {Integer (Int32)}
     */
    static LoggerEventsLostClass => 8

    /**
     * @type {Integer (Int32)}
     */
    static TraceSessionSettingsClass => 9

    /**
     * @type {Integer (Int32)}
     */
    static LoggerEventsLoggedClass => 10

    /**
     * @type {Integer (Int32)}
     */
    static DiskIoNotifyRoutinesClass => 11

    /**
     * @type {Integer (Int32)}
     */
    static TraceInformationClassReserved1 => 12

    /**
     * @type {Integer (Int32)}
     */
    static FltIoNotifyRoutinesClass => 13

    /**
     * @type {Integer (Int32)}
     */
    static TraceInformationClassReserved2 => 14

    /**
     * @type {Integer (Int32)}
     */
    static WdfNotifyRoutinesClass => 15

    /**
     * @type {Integer (Int32)}
     */
    static MaxTraceInformationClass => 16
}
