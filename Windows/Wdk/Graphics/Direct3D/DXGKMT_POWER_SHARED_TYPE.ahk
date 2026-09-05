#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMT_POWER_SHARED_TYPE extends Win32Enum {

    /**
     * Native name: DXGKMT_POWER_SHARED_TYPE_AUDIO
     * @type {Integer (Int32)}
     */
    static AUDIO => 0
}
