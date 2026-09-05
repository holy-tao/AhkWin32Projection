#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_DEVICEEXECUTION_STATE extends Win32Enum {

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_ACTIVE
     * @type {Integer (Int32)}
     */
    static ACTIVE => 1

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 2

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_HUNG
     * @type {Integer (Int32)}
     */
    static HUNG => 3

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_STOPPED
     * @type {Integer (Int32)}
     */
    static STOPPED => 4

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_ERROR_OUTOFMEMORY
     * @type {Integer (Int32)}
     */
    static ERROR_OUTOFMEMORY => 5

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_ERROR_DMAFAULT
     * @type {Integer (Int32)}
     */
    static ERROR_DMAFAULT => 6

    /**
     * Native name: D3DKMT_DEVICEEXECUTION_ERROR_DMAPAGEFAULT
     * @type {Integer (Int32)}
     */
    static ERROR_DMAPAGEFAULT => 7
}
