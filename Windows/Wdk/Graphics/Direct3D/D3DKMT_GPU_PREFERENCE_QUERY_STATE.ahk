#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_GPU_PREFERENCE_QUERY_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_HIGH_PERFORMANCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_MINIMUM_POWER => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_UNSPECIFIED => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_NOT_FOUND => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_STATE_USER_SPECIFIED_GPU => 5
}
