#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Specifies the format for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_d3dformat_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_STREAM_STATE_D3DFORMAT_DATA {
    #StructPack 4

    /**
     * The surface format, specified as a <b>D3DFORMAT</b> value. You can also use a FOURCC code to specify a format that is not defined in the <b>D3DFORMAT</b> enumeration. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-fourccs">Video FOURCCs</a>.
     * 
     * The default state value is <b>D3DFMT_UNKNOWN</b>.
     */
    Format : D3DFORMAT

}
