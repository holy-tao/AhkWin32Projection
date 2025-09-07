#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RFCOMM_MSC_DATA.ahk
#Include .\RFCOMM_RPN_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class RFCOMM_COMMAND extends Win32Struct
{
    static sizeof => 5

    static packingSize => 1

    /**
     * @type {Integer}
     */
    CmdType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {RFCOMM_MSC_DATA}
     */
    MSC{
        get {
            if(!this.HasProp("__MSC"))
                this.__MSC := RFCOMM_MSC_DATA(this.ptr + 4)
            return this.__MSC
        }
    }

    /**
     * @type {Integer}
     */
    RLS {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {RFCOMM_RPN_DATA}
     */
    RPN{
        get {
            if(!this.HasProp("__RPN"))
                this.__RPN := RFCOMM_RPN_DATA(this.ptr + 4)
            return this.__RPN
        }
    }
}
