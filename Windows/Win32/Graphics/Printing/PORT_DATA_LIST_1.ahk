#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PORT_DATA_2.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PORT_DATA_LIST_1 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cPortData {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<PORT_DATA_2>}
     */
    pPortData{
        get {
            if(!this.HasProp("__pPortDataProxyArray"))
                this.__pPortDataProxyArray := Win32FixedArray(this.ptr + 8, 8, PORT_DATA_2, "")
            return this.__pPortDataProxyArray
        }
    }
}
