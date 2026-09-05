#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VIDMMESCAPETYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_SETFAULT
     * @type {Integer (Int32)}
     */
    static SETFAULT => 0

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_RUN_COHERENCY_TEST
     * @type {Integer (Int32)}
     */
    static RUN_COHERENCY_TEST => 1

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_RUN_UNMAP_TO_DUMMY_PAGE_TEST
     * @type {Integer (Int32)}
     */
    static RUN_UNMAP_TO_DUMMY_PAGE_TEST => 2

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_APERTURE_CORRUPTION_CHECK
     * @type {Integer (Int32)}
     */
    static APERTURE_CORRUPTION_CHECK => 3

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_SUSPEND_CPU_ACCESS_TEST
     * @type {Integer (Int32)}
     */
    static SUSPEND_CPU_ACCESS_TEST => 4

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_EVICT
     * @type {Integer (Int32)}
     */
    static EVICT => 5

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_EVICT_BY_NT_HANDLE
     * @type {Integer (Int32)}
     */
    static EVICT_BY_NT_HANDLE => 6

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_GET_VAD_INFO
     * @type {Integer (Int32)}
     */
    static GET_VAD_INFO => 7

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_SET_BUDGET
     * @type {Integer (Int32)}
     */
    static SET_BUDGET => 8

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_SUSPEND_PROCESS
     * @type {Integer (Int32)}
     */
    static SUSPEND_PROCESS => 9

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_RESUME_PROCESS
     * @type {Integer (Int32)}
     */
    static RESUME_PROCESS => 10

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_GET_BUDGET
     * @type {Integer (Int32)}
     */
    static GET_BUDGET => 11

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_SET_TRIM_INTERVALS
     * @type {Integer (Int32)}
     */
    static SET_TRIM_INTERVALS => 12

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_EVICT_BY_CRITERIA
     * @type {Integer (Int32)}
     */
    static EVICT_BY_CRITERIA => 13

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_WAKE
     * @type {Integer (Int32)}
     */
    static WAKE => 14

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_DEFRAG
     * @type {Integer (Int32)}
     */
    static DEFRAG => 15

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_DELAYEXECUTION
     * @type {Integer (Int32)}
     */
    static DELAYEXECUTION => 16

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_VALIDATE_INTEGRITY
     * @type {Integer (Int32)}
     */
    static VALIDATE_INTEGRITY => 17

    /**
     * Native name: D3DKMT_VIDMMESCAPETYPE_SET_EVICTION_CONFIG
     * @type {Integer (Int32)}
     */
    static SET_EVICTION_CONFIG => 18
}
