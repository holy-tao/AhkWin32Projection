#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_PNP_KEY_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PNP_KEY_HARDWARE => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PNP_KEY_SOFTWARE => 2
}
