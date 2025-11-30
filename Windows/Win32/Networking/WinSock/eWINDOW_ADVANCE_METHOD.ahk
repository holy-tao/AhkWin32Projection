#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The eWINDOW_ADVANCE_METHOD enumeration specifies the window advance mode used for Reliable Multicast.
 * @see https://docs.microsoft.com/windows/win32/api//wsrm/ne-wsrm-ewindow_advance_method
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class eWINDOW_ADVANCE_METHOD extends Win32Enum{

    /**
     * Window advances based on time. This is the default mode.
     * @type {Integer (Int32)}
     */
    static E_WINDOW_ADVANCE_BY_TIME => 1

    /**
     * Use the receive window as a data cache.
     * @type {Integer (Int32)}
     */
    static E_WINDOW_USE_AS_DATA_CACHE => 2
}
