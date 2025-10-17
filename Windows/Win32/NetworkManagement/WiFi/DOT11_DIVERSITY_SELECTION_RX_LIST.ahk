#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_DIVERSITY_SELECTION_RX.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_DIVERSITY_SELECTION_RX_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<DOT11_DIVERSITY_SELECTION_RX>}
     */
    dot11DiversitySelectionRx{
        get {
            if(!this.HasProp("__dot11DiversitySelectionRxProxyArray"))
                this.__dot11DiversitySelectionRxProxyArray := Win32FixedArray(this.ptr + 8, 1, DOT11_DIVERSITY_SELECTION_RX, "")
            return this.__dot11DiversitySelectionRxProxyArray
        }
    }
}
