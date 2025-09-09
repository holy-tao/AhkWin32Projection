#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11_RECV_SENSITIVITY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_RECV_SENSITIVITY_LIST extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dot11PhyType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uPhyId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uNumOfEntries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uTotalNumOfEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<DOT11_RECV_SENSITIVITY>}
     */
    dot11RecvSensitivity{
        get {
            if(!this.HasProp("__dot11RecvSensitivityProxyArray"))
                this.__dot11RecvSensitivityProxyArray := Win32FixedArray(this.ptr + 16, 1, DOT11_RECV_SENSITIVITY, "")
            return this.__dot11RecvSensitivityProxyArray
        }
    }
}
