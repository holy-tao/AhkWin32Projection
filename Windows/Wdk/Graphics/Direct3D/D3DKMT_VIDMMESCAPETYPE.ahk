#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_VIDMMESCAPETYPE {
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
