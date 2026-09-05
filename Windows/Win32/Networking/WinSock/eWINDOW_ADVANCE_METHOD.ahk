#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The eWINDOW_ADVANCE_METHOD enumeration specifies the window advance mode used for Reliable Multicast.
 * @see https://learn.microsoft.com/windows/win32/api/wsrm/ne-wsrm-ewindow_advance_method
 * @namespace Windows.Win32.Networking.WinSock
 */
class eWINDOW_ADVANCE_METHOD extends Win32Enum {

    /**
     * Window advances based on time. This is the default mode.
     * Native name: E_WINDOW_ADVANCE_BY_TIME
     * @type {Integer (Int32)}
     */
    static BY_TIME => 1

    /**
     * Use the receive window as a data cache.
     * Native name: E_WINDOW_USE_AS_DATA_CACHE
     * @type {Integer (Int32)}
     */
    static USE_AS_DATA_CACHE => 2
}
