#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class FALLBACK_INDEX extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static FallbackIndexTcpFastopen => 0

    /**
     * @type {Integer (Int32)}
     */
    static FallbackIndexMax => 1
}
