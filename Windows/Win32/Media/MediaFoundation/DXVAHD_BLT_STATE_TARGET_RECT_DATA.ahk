#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Specifies the target rectangle for blitting, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_target_rect_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_BLT_STATE_TARGET_RECT_DATA {
    #StructPack 4

    /**
     * Specifies whether to use the target rectangle. The default state value is <b>FALSE</b>.
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
     * Use the target rectangle specified by the <b>TargetRect</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the entire destination surface as the target rectangle. Ignore the <b>TargetRect</b> member.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Enable : BOOL

    /**
     * Specifies the <i>target rectangle</i>. The target rectangle is the area within the destination surface where the output will be drawn. The target rectangle is given in pixel coordinates, relative to the destination surface. The default state value is an empty rectangle, (0, 0, 0, 0).
     * 
     * If the <b>Enable</b> member is <b>FALSE</b>, the <b>TargetRect</b> member is ignored.
     */
    TargetRect : RECT

}
