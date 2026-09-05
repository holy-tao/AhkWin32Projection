#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
class FALLBACK_INDEX extends Win32Enum {

    /**
     * Native name: FallbackIndexTcpFastopen
     * @type {Integer (Int32)}
     */
    static TcpFastopen => 0

    /**
     * Native name: FallbackIndexMax
     * @type {Integer (Int32)}
     */
    static Max => 1
}
