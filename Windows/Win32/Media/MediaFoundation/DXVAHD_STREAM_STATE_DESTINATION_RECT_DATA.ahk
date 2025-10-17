#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk

/**
 * Specifies the destination rectangle for an input stream, when using Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @see https://docs.microsoft.com/windows/win32/api//dxvahd/ns-dxvahd-dxvahd_stream_state_destination_rect_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_DESTINATION_RECT_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Specifies whether to use the destination rectangle, or use the entire output surface. The default state value is <b>FALSE</b>.
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
     * Use the destination rectangle given in the <b>DestinationRect</b> member.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the entire output surface as the destination rectangle.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {BOOL}
     */
    Enable {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The <i>destination rectangle</i>, which defines the portion of the output surface where the source rectangle is blitted. The destination rectangle is given in pixel coordinates, relative to the output surface. The default value is an empty rectangle, (0, 0, 0, 0).
     * 
     * If the <b>Enable</b> member is <b>FALSE</b>, the <b>DestinationRect</b> member is ignored.
     * @type {RECT}
     */
    DestinationRect{
        get {
            if(!this.HasProp("__DestinationRect"))
                this.__DestinationRect := RECT(8, this)
            return this.__DestinationRect
        }
    }
}
