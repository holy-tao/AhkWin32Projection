#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\RFCOMM_MSC_DATA.ahk
#Include .\RFCOMM_RLS_DATA.ahk
#Include .\RFCOMM_RPN_DATA.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class RFCOMM_COMMAND extends Win32Struct
{
    static sizeof => 14

    static packingSize => 7

    class _Data_e__Union extends Win32Struct {
        static sizeof => 7
        static packingSize => 7

        /**
         * @type {RFCOMM_MSC_DATA}
         */
        MSC{
            get {
                if(!this.HasProp("__MSC"))
                    this.__MSC := RFCOMM_MSC_DATA(0, this)
                return this.__MSC
            }
        }
    
        /**
         * @type {RFCOMM_RLS_DATA}
         */
        RLS{
            get {
                if(!this.HasProp("__RLS"))
                    this.__RLS := RFCOMM_RLS_DATA(0, this)
                return this.__RLS
            }
        }
    
        /**
         * @type {RFCOMM_RPN_DATA}
         */
        RPN{
            get {
                if(!this.HasProp("__RPN"))
                    this.__RPN := RFCOMM_RPN_DATA(0, this)
                return this.__RPN
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    CmdType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {_Data_e__Union}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := %this.__Class%._Data_e__Union(7, this)
            return this.__Data
        }
    }
}
