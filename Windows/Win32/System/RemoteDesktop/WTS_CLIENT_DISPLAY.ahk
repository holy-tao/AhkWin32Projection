#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the display of a Remote Desktop Connection (RDC) client. (WTS_CLIENT_DISPLAY)
 * @see https://learn.microsoft.com/windows/win32/api/wtsapi32/ns-wtsapi32-wts_client_display
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_CLIENT_DISPLAY {
    #StructPack 4

    /**
     * Horizontal dimension, in pixels, of the client's display.
     */
    HorizontalResolution : UInt32

    /**
     * Vertical dimension, in pixels, of the client's display.
     */
    VerticalResolution : UInt32

    ColorDepth : UInt32

}
