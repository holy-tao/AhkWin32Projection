#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class VIRTUAL_FREE_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_DECOMMIT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static MEM_RELEASE => 32768
}
