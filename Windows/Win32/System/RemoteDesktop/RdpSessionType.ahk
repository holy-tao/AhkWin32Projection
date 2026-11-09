#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 */
class RdpSessionType extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static Desktop => 0

    /**
     * @type {Integer (Int32)}
     */
    static RemoteApp => 1
}
