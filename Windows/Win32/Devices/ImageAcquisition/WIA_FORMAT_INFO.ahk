#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The WIA_FORMAT_INFO structure specifies valid format and media type pairs for a device.
 * @see https://learn.microsoft.com/windows/win32/api/wia_xp/ns-wia_xp-wia_format_info
 * @namespace Windows.Win32.Devices.ImageAcquisition
 */
class WIA_FORMAT_INFO extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * Type: <b>GUID</b>
     * 
     * GUID that identifies the format.
     * @type {Guid}
     */
    guidFormatID {
        get {
            if(!this.HasProp("__guidFormatID"))
                this.__guidFormatID := Guid(0, this)
            return this.__guidFormatID
        }
    }

    /**
     * Type: <b>LONG</b>
     * 
     * The media type that corresponds to the <b>guidFormatID</b> member.
     * @type {Integer}
     */
    lTymed {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
