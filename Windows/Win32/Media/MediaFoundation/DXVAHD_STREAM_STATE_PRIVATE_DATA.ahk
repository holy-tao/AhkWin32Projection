#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for a private stream state, for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) input stream.
 * @remarks
 * Use this structure for proprietary or device-specific state parameters.
 * 
 * The caller allocates the <b>pData</b> array. Set the <b>DataSize</b> member to the size of the array in bytes. When retrieving the state data, you can set the <b>pData</b> member to <b>NULL</b> to get the size of the data. The device will return the size in the <b>DataSize</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_STREAM_STATE_PRIVATE_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A GUID that identifies the private stream state. The following GUID is defined.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="DXVAHD_STREAM_STATE_PRIVATE_IVTC"></a><a id="dxvahd_stream_state_private_ivtc"></a><dl>
     * <dt><b>DXVAHD_STREAM_STATE_PRIVATE_IVTC</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Retrieves statistics about inverse telecine. The state data (<b>pData</b>) is a <a href="https://docs.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_ivtc_data">DXVAHD_STREAM_STATE_PRIVATE_IVTC_DATA</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * A device can define additional GUIDs for use with custom stream states. The interpretation of the data is then defined by the device.
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pData</b> member.
     * @type {Integer}
     */
    DataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a buffer that contains the private state data. The DXVA-HD runtime passes this buffer directly to the device, without validation.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
