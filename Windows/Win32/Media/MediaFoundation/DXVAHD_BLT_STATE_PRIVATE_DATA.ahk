#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains data for a private blit state for Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * Use this structure for proprietary or device-specific state parameters. 
 * 
 * The caller allocates the <b>pData</b> array. Set the  <b>DataSize</b> member to the size of the array in bytes. When retrieving the state data, you can set <b>pData</b> to <b>NULL</b> to get the size of the data. The device will return the size in the <b>DataSize</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_private_data
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVAHD_BLT_STATE_PRIVATE_DATA {
    #StructPack 8

    /**
     * A GUID that identifies the private state. The meaning of this value is defined by the device.
     */
    Guid : Guid

    /**
     * The size, in bytes, of the buffer pointed to by the <b>pData</b> member.
     */
    DataSize : UInt32

    /**
     * A pointer to a buffer that contains the private state data. The DXVA-HD runtime passes this buffer directly to the device without validation.
     */
    pData : IntPtr

}
