#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information about the display of a Remote Desktop Connection (RDC) client. (CLIENT_DISPLAY)
 * @see https://learn.microsoft.com/windows/win32/api/sessdirpublictypes/ns-sessdirpublictypes-client_display
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct CLIENT_DISPLAY {
    #StructPack 4

    /**
     * The horizontal dimension, in pixels, of the client's display.
     */
    HorizontalResolution : UInt32

    /**
     * The vertical dimension, in pixels, of the client's display.
     */
    VerticalResolution : UInt32

    /**
     * The color depth of the client's display. For possible values, see the <b>ColorDepth</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsapi32/ns-wtsapi32-wts_client_display">WTS_CLIENT_DISPLAY</a> structure.
     */
    ColorDepth : UInt32

}
