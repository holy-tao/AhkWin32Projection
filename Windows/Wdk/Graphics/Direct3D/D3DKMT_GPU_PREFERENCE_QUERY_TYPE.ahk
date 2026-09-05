#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_GPU_PREFERENCE_QUERY_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_TYPE_IHV_DLIST
     * @type {Integer (Int32)}
     */
    static IHV_DLIST => 0

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_TYPE_DX_DATABASE
     * @type {Integer (Int32)}
     */
    static DX_DATABASE => 1

    /**
     * Native name: D3DKMT_GPU_PREFERENCE_TYPE_USER_PREFERENCE
     * @type {Integer (Int32)}
     */
    static USER_PREFERENCE => 2
}
