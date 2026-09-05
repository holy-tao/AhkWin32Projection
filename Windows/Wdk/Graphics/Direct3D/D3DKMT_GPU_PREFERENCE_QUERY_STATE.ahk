#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_GPU_PREFERENCE_QUERY_STATE extends Win32Enum {

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_STATE_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static UNINITIALIZED => 0

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_STATE_HIGH_PERFORMANCE
     * @type {Integer (Int32)}
     */
    static HIGH_PERFORMANCE => 1

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_STATE_MINIMUM_POWER
     * @type {Integer (Int32)}
     */
    static MINIMUM_POWER => 2

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_STATE_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 3

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_STATE_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static NOT_FOUND => 4

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_STATE_USER_SPECIFIED_GPU
     * @type {Integer (Int32)}
     */
    static USER_SPECIFIED_GPU => 5
}
