#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistics for the RemoteFX media redirection bitmap renderer.
 * @see https://learn.microsoft.com/windows/win32/api/tsvirtualchannels/ns-tsvirtualchannels-bitmap_renderer_statistics
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class BITMAP_RENDERER_STATISTICS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The number of frames delivered.
     * @type {Integer}
     */
    dwFramesDelivered {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of frames dropped.
     * @type {Integer}
     */
    dwFramesDropped {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
