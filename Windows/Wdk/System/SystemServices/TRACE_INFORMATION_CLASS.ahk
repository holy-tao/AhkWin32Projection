#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class TRACE_INFORMATION_CLASS extends Win32Enum{

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
