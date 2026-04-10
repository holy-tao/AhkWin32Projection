#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PROTECTED_SESSION_STATUS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PROTECTED_SESSION_STATUS_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PROTECTED_SESSION_STATUS_INVALID => 1
}
