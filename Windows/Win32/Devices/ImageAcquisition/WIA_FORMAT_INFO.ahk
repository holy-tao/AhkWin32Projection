#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WIA_FORMAT_INFO structure specifies valid format and media type pairs for a device.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_format_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class WIA_FORMAT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * GUID that identifies the format.
     * @type {Pointer<Guid>}
     */
    guidFormatID {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The media type that corresponds to the <b>guidFormatID</b> member.
     * @type {Integer}
     */
    lTymed {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
