#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DDDIGPUVIRTUALADDRESS_RESERVATION_TYPE extends Win32Enum {

    /**
     * Native name: D3DDDIGPUVIRTUALADDRESS_RESERVE_NO_ACCESS
     * @type {Integer (Int32)}
     */
    static RESERVE_NO_ACCESS => 0

    /**
     * Native name: D3DDDIGPUVIRTUALADDRESS_RESERVE_ZERO
     * @type {Integer (Int32)}
     */
    static RESERVE_ZERO => 1

    /**
     * Native name: D3DDDIGPUVIRTUALADDRESS_RESERVE_NO_COMMIT
     * @type {Integer (Int32)}
     */
    static RESERVE_NO_COMMIT => 2
}
