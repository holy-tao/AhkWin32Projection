#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Specifies the source rectangle for an input stream when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_stream_state_source_rect_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_SOURCE_RECT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * @type {BOOL}
     */
    Enable{
        get {
            if(!this.HasProp("__Enable"))
                this.__Enable := BOOL(this.ptr + 0)
            return this.__Enable
        }
    }

    /**
     * The <i>source rectangle</i>, which defines the portion of the input sample that is blitted to the destination surface. The source rectangle is given in pixel coordinates, relative to the input surface. The default state value is an empty rectangle, (0, 0, 0, 0).
     * 
     * If the <b>Enable</b> member is <b>FALSE</b>, the <b>SourceRect</b> member is ignored.
     * @type {RECT}
     */
    SourceRect{
        get {
            if(!this.HasProp("__SourceRect"))
                this.__SourceRect := RECT(this.ptr + 8)
            return this.__SourceRect
        }
    }
}
