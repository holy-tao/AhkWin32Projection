#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PROTECTED_SESSION_STATUS extends Win32Enum {

    /**
     * Native name: D3DKMT_PROTECTED_SESSION_STATUS_OK
     * @type {Integer (Int32)}
     */
    static OK => 0

    /**
     * Native name: D3DKMT_PROTECTED_SESSION_STATUS_INVALID
     * @type {Integer (Int32)}
     */
    static INVALID => 1
}
