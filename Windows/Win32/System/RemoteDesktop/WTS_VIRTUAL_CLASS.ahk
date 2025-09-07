#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains values that indicate the type of virtual channel information to retrieve.
 * @remarks
 * For an example that shows the use of the WTSVirtualFileHandle value, see <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/nf-wtsapi32-wtsvirtualchannelquery">WTSVirtualChannelQuery</a>. This example shows how to gain access to a virtual channel file handle that can be used for asynchronous I/O.
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ne-wtsapi32-wts_virtual_class
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_VIRTUAL_CLASS{

    /**
     * This value is not currently supported.
     * @type {Integer (Int32)}
     */
    static WTSVirtualClientData => 0

    /**
     * Indicates a request for the file handle of a virtual channel that can be used for asynchronous I/O.
     * @type {Integer (Int32)}
     */
    static WTSVirtualFileHandle => 1
}
