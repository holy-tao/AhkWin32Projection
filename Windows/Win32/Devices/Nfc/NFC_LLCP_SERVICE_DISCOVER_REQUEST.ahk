#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_LLCP_SERVICE_NAME_ENTRY.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_LLCP_SERVICE_DISCOVER_REQUEST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    hRemoteDev {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumberOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<NFC_LLCP_SERVICE_NAME_ENTRY>}
     */
    ServiceNameEntries{
        get {
            if(!this.HasProp("__ServiceNameEntriesProxyArray"))
                this.__ServiceNameEntriesProxyArray := Win32FixedArray(this.ptr + 16, 8, NFC_LLCP_SERVICE_NAME_ENTRY, "")
            return this.__ServiceNameEntriesProxyArray
        }
    }
}
