#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_AUXILIARYPRESENTINFO_TYPE extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_AUXILIARYPRESENTINFO_TYPE_FLIPMANAGER => 0
}
