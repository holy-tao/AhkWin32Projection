#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_PROTOCOL_SPECIFIC_DATA_EXT.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_PROTOCOL_DATA_DESCRIPTOR_EXT extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {STORAGE_PROTOCOL_SPECIFIC_DATA_EXT}
     */
    ProtocolSpecificData{
        get {
            if(!this.HasProp("__ProtocolSpecificData"))
                this.__ProtocolSpecificData := STORAGE_PROTOCOL_SPECIFIC_DATA_EXT(8, this)
            return this.__ProtocolSpecificData
        }
    }
}
