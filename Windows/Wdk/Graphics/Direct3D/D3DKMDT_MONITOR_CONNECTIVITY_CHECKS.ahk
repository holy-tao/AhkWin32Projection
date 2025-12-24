#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_MONITOR_CONNECTIVITY_CHECKS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCC_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCC_IGNORE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_MCC_ENFORCE => 2
}
