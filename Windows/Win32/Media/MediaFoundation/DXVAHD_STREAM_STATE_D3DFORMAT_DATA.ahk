#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the format for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_D3DFORMAT_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * The surface format, specified as a <b>D3DFORMAT</b> value. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * 
     * The default state value is <b>D3DFMT_UNKNOWN</b>.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
