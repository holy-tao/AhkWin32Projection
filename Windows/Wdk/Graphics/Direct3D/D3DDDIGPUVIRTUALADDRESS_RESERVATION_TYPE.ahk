#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DDDIGPUVIRTUALADDRESS_RESERVATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIGPUVIRTUALADDRESS_RESERVE_NO_ACCESS => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIGPUVIRTUALADDRESS_RESERVE_ZERO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DDDIGPUVIRTUALADDRESS_RESERVE_NO_COMMIT => 2
}
