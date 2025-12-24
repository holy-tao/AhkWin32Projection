#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DEVICEEXECUTION_STATE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_RESET => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_HUNG => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_STOPPED => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ERROR_OUTOFMEMORY => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ERROR_DMAFAULT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_DEVICEEXECUTION_ERROR_DMAPAGEFAULT => 7
}
