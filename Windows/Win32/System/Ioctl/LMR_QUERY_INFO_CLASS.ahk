#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class LMR_QUERY_INFO_CLASS extends Win32Enum {

    /**
     * Native name: LMRQuerySessionInfo
     * @type {Integer (Int32)}
     */
    static SessionInfo => 1
}
