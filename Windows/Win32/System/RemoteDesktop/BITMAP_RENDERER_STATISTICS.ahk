#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistics for the RemoteFX media redirection bitmap renderer.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/ns-tsvirtualchannels-bitmap_renderer_statistics
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct BITMAP_RENDERER_STATISTICS {
    #StructPack 4

    /**
     * The number of frames delivered.
     */
    dwFramesDelivered : UInt32

    /**
     * The number of frames dropped.
     */
    dwFramesDropped : UInt32

}
