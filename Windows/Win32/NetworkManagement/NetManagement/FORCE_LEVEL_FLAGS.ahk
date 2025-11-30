#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class FORCE_LEVEL_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static USE_NOFORCE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USE_FORCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static USE_LOTS_OF_FORCE => 2
}
