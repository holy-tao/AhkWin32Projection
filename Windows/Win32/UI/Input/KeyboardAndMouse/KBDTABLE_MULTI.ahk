#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KBDTABLE_DESC.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class KBDTABLE_MULTI extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    nTables {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<KBDTABLE_DESC>}
     */
    aKbdTables{
        get {
            if(!this.HasProp("__aKbdTablesProxyArray"))
                this.__aKbdTablesProxyArray := Win32FixedArray(this.ptr + 8, 8, KBDTABLE_DESC, "")
            return this.__aKbdTablesProxyArray
        }
    }
}
