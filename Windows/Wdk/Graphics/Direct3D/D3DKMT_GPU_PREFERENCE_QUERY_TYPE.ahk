#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_GPU_PREFERENCE_QUERY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_TYPE_IHV_DLIST => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_TYPE_DX_DATABASE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_GPU_PREFERENCE_TYPE_USER_PREFERENCE => 2
}
