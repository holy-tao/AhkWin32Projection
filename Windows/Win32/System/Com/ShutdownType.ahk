#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class ShutdownType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IdleShutdown => 0

    /**
     * @type {Integer (Int32)}
     */
    static ForcedShutdown => 1
}
