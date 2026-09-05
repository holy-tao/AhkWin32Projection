#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class TRACE_INFORMATION_CLASS extends Win32Enum {

    /**
     * Native name: TraceIdClass
     * @type {Integer (Int32)}
     */
    static IdClass => 0

    /**
     * Native name: TraceHandleClass
     * @type {Integer (Int32)}
     */
    static HandleClass => 1

    /**
     * Native name: TraceEnableFlagsClass
     * @type {Integer (Int32)}
     */
    static EnableFlagsClass => 2

    /**
     * Native name: TraceEnableLevelClass
     * @type {Integer (Int32)}
     */
    static EnableLevelClass => 3

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
     * Native name: TraceHandleByNameClass
     * @type {Integer (Int32)}
     */
    static HandleByNameClass => 7

    /**
     * @type {Integer (Int32)}
     */
    static LoggerEventsLostClass => 8

    /**
     * Native name: TraceSessionSettingsClass
     * @type {Integer (Int32)}
     */
    static SessionSettingsClass => 9

    /**
     * @type {Integer (Int32)}
     */
    static LoggerEventsLoggedClass => 10

    /**
     * @type {Integer (Int32)}
     */
    static DiskIoNotifyRoutinesClass => 11

    /**
     * Native name: TraceInformationClassReserved1
     * @type {Integer (Int32)}
     */
    static Reserved1 => 12

    /**
     * @type {Integer (Int32)}
     */
    static FltIoNotifyRoutinesClass => 13

    /**
     * Native name: TraceInformationClassReserved2
     * @type {Integer (Int32)}
     */
    static Reserved2 => 14

    /**
     * @type {Integer (Int32)}
     */
    static WdfNotifyRoutinesClass => 15

    /**
     * @type {Integer (Int32)}
     */
    static MaxTraceInformationClass => 16
}
