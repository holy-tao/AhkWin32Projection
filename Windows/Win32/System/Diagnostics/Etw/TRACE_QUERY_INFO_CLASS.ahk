#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/evntrace/ne-evntrace-trace_query_info_class
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_QUERY_INFO_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static TraceGuidQueryList => 0

    /**
     * @type {Integer (Int32)}
     */
    static TraceGuidQueryInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static TraceGuidQueryProcess => 2

    /**
     * @type {Integer (Int32)}
     */
    static TraceStackTracingInfo => 3

    /**
     * @type {Integer (Int32)}
     */
    static TraceSystemTraceEnableFlagsInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static TraceSampledProfileIntervalInfo => 5

    /**
     * @type {Integer (Int32)}
     */
    static TraceProfileSourceConfigInfo => 6

    /**
     * @type {Integer (Int32)}
     */
    static TraceProfileSourceListInfo => 7

    /**
     * @type {Integer (Int32)}
     */
    static TracePmcEventListInfo => 8

    /**
     * @type {Integer (Int32)}
     */
    static TracePmcCounterListInfo => 9

    /**
     * @type {Integer (Int32)}
     */
    static TraceSetDisallowList => 10

    /**
     * @type {Integer (Int32)}
     */
    static TraceVersionInfo => 11

    /**
     * @type {Integer (Int32)}
     */
    static TraceGroupQueryList => 12

    /**
     * @type {Integer (Int32)}
     */
    static TraceGroupQueryInfo => 13

    /**
     * @type {Integer (Int32)}
     */
    static TraceDisallowListQuery => 14

    /**
     * @type {Integer (Int32)}
     */
    static TraceInfoReserved15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static TracePeriodicCaptureStateListInfo => 16

    /**
     * @type {Integer (Int32)}
     */
    static TracePeriodicCaptureStateInfo => 17

    /**
     * @type {Integer (Int32)}
     */
    static TraceProviderBinaryTracking => 18

    /**
     * @type {Integer (Int32)}
     */
    static TraceMaxLoggersQuery => 19

    /**
     * @type {Integer (Int32)}
     */
    static TraceLbrConfigurationInfo => 20

    /**
     * @type {Integer (Int32)}
     */
    static TraceLbrEventListInfo => 21

    /**
     * @type {Integer (Int32)}
     */
    static TraceMaxPmcCounterQuery => 22

    /**
     * @type {Integer (Int32)}
     */
    static TraceStreamCount => 23

    /**
     * @type {Integer (Int32)}
     */
    static TraceStackCachingInfo => 24

    /**
     * @type {Integer (Int32)}
     */
    static TracePmcCounterOwners => 25

    /**
     * @type {Integer (Int32)}
     */
    static TraceUnifiedStackCachingInfo => 26

    /**
     * @type {Integer (Int32)}
     */
    static TracePmcSessionInformation => 27

    /**
     * @type {Integer (Int32)}
     */
    static TraceContextRegisterInfo => 28

    /**
     * @type {Integer (Int32)}
     */
    static MaxTraceSetInfoClass => 29
}
