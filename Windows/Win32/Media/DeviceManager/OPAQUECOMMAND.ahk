#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The OPAQUECOMMAND structure contains data for commands that are passed through Windows Media Device Manager to a device but are not intended to be acted upon by Windows Media Device Manager.
 * @see https://learn.microsoft.com/windows/win32/WMDM/opaquecommand
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class OPAQUECOMMAND extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * 
     * @type {Pointer<Guid>}
     */
    guidCommand {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Length of the data to which *pData* points, in bytes.
     * @type {Integer}
     */
    dwDataLen {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Data required to execute the command, and/or data returned by the command.
     * 
     * 
     * **abMAC\[20\]**
     * 
     * This message authentication code (MAC) should include the **guidCommand** member, the data to which *pdwDataLen* points, and the data to which *pData* points, if any. If *pData* is **NULL**, it must not be included in the MAC. WMDM\_MAC\_LENGTH is defined as 20.
     * @type {Pointer<Byte>}
     */
    pData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    abMAC{
        get {
            if(!this.HasProp("__abMACProxyArray"))
                this.__abMACProxyArray := Win32FixedArray(this.ptr + 24, 20, Primitive, "char")
            return this.__abMACProxyArray
        }
    }
}
