#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies the source rectangle for an input stream when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_source_rect_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_STREAM_STATE_SOURCE_RECT_DATA {
    #StructPack 4

    /**
     * <b></b>Specifies whether to blit the entire input surface or just the source rectangle. The default state value is <b>FALSE</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the source rectangle specified in the <b>SourceRect</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Blit the entire input surface. Ignore the <b>SourceRect</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Enable : BOOL

    /**
     * The <i>source rectangle</i>, which defines the portion of the input sample that is blitted to the destination surface. The source rectangle is given in pixel coordinates, relative to the input surface. The default state value is an empty rectangle, (0, 0, 0, 0).
     * 
     * If the <b>Enable</b> member is <b>FALSE</b>, the <b>SourceRect</b> member is ignored.
     */
    SourceRect : RECT

}
