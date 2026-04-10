#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\KBDTABLE_DESC.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
class KBDTABLE_MULTI extends Win32Struct {
    static sizeof => 580

    static packingSize => 4

    /**
     * @type {Integer}
     */
    nTables {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {KBDTABLE_DESC}
     */
    aKbdTables {
        get {
            if(!this.HasProp("__aKbdTablesProxyArray"))
                this.__aKbdTablesProxyArray := Win32FixedArray(this.ptr + 4, 8, KBDTABLE_DESC, "")
            return this.__aKbdTablesProxyArray
        }
    }
}
