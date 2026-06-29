#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains data for a private stream state, for a Microsoft DirectX Video Acceleration High Definition (DXVA-HD) input stream.
 * @remarks
 * Use this structure for proprietary or device-specific state parameters.
 * 
 * The caller allocates the <b>pData</b> array. Set the <b>DataSize</b> member to the size of the array in bytes. When retrieving the state data, you can set the <b>pData</b> member to <b>NULL</b> to get the size of the data. The device will return the size in the <b>DataSize</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_stream_state_private_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_STREAM_STATE_PRIVATE_DATA {
    #StructPack 8

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
     */
    Guid : Guid

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pData</b> member.
     */
    DataSize : UInt32

    /**
     * A pointer to a buffer that contains the private state data. The DXVA-HD runtime passes this buffer directly to the device, without validation.
     */
    pData : IntPtr

}
