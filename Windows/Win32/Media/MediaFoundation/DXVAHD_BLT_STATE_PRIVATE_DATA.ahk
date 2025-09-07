#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for a private blit state for Microsoft DirectX Video Acceleration High Definition (DXVA-HD).
 * @remarks
 * Use this structure for proprietary or device-specific state parameters. 
  * 
  * The caller allocates the <b>pData</b> array. Set the  <b>DataSize</b> member to the size of the array in bytes. When retrieving the state data, you can set <b>pData</b> to <b>NULL</b> to get the size of the data. The device will return the size in the <b>DataSize</b> member.
 * @see https://learn.microsoft.com/windows/win32/api/dxvahd/ns-dxvahd-dxvahd_blt_state_private_data
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVAHD_BLT_STATE_PRIVATE_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A GUID that identifies the private state. The meaning of this value is defined by the device.
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
     * A pointer to a buffer that contains the private state data. The DXVA-HD runtime passes this buffer directly to the device without validation.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
