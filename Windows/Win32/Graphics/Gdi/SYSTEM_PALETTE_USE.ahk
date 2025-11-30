#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class SYSTEM_PALETTE_USE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SYSPAL_NOSTATIC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYSPAL_NOSTATIC256 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SYSPAL_STATIC => 1
}
