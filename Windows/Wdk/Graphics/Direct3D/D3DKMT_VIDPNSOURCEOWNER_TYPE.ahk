#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_VIDPNSOURCEOWNER_TYPE extends Win32Enum {

    /**
     * Native name: D3DKMT_VIDPNSOURCEOWNER_UNOWNED
     * @type {Integer (Int32)}
     */
    static UNOWNED => 0

    /**
     * Native name: D3DKMT_VIDPNSOURCEOWNER_SHARED
     * @type {Integer (Int32)}
     */
    static SHARED => 1

    /**
     * Native name: D3DKMT_VIDPNSOURCEOWNER_EXCLUSIVE
     * @type {Integer (Int32)}
     */
    static EXCLUSIVE => 2

    /**
     * Native name: D3DKMT_VIDPNSOURCEOWNER_EXCLUSIVEGDI
     * @type {Integer (Int32)}
     */
    static EXCLUSIVEGDI => 3

    /**
     * Native name: D3DKMT_VIDPNSOURCEOWNER_EMULATED
     * @type {Integer (Int32)}
     */
    static EMULATED => 4
}
