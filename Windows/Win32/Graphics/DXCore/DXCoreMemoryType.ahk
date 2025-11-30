#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.DXCore
 * @version v4.0.30319
 */
class DXCoreMemoryType extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static Dedicated => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Shared => 1
}
