#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SECURE_ELEMENT_TECH_ROUTING_INFO.ahk
#Include .\SECURE_ELEMENT_PROTO_ROUTING_INFO.ahk
#Include .\SECURE_ELEMENT_AID_ROUTING_INFO.ahk
#Include .\SECURE_ELEMENT_ROUTING_TABLE_ENTRY.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class SECURE_ELEMENT_ROUTING_TABLE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SECURE_ELEMENT_ROUTING_TABLE_ENTRY>}
     */
    TableEntries{
        get {
            if(!this.HasProp("__TableEntriesProxyArray"))
                this.__TableEntriesProxyArray := Win32FixedArray(this.ptr + 8, 8, SECURE_ELEMENT_ROUTING_TABLE_ENTRY, "")
            return this.__TableEntriesProxyArray
        }
    }
}
