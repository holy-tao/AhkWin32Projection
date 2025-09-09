#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SERVICE_TYPE_VALUE.ahk

/**
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SERVICE_TYPE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwTypeNameOffset {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwValueCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<SERVICE_TYPE_VALUE>}
     */
    Values{
        get {
            if(!this.HasProp("__ValuesProxyArray"))
                this.__ValuesProxyArray := Win32FixedArray(this.ptr + 8, 1, SERVICE_TYPE_VALUE, "")
            return this.__ValuesProxyArray
        }
    }
}
