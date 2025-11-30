#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_VIDMMESCAPETYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_SETFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_RUN_COHERENCY_TEST => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_RUN_UNMAP_TO_DUMMY_PAGE_TEST => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_APERTURE_CORRUPTION_CHECK => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_SUSPEND_CPU_ACCESS_TEST => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_EVICT => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_EVICT_BY_NT_HANDLE => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_GET_VAD_INFO => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_SET_BUDGET => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_SUSPEND_PROCESS => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_RESUME_PROCESS => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_GET_BUDGET => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_SET_TRIM_INTERVALS => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_EVICT_BY_CRITERIA => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_WAKE => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_DEFRAG => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_DELAYEXECUTION => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_VALIDATE_INTEGRITY => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_VIDMMESCAPETYPE_SET_EVICTION_CONFIG => 18
}
