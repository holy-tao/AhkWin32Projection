#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DEV_OBJECT.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEV_QUERY_RESULT_ACTION_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    class _DEV_QUERY_RESULT_UPDATE_PAYLOAD extends Win32Struct {
        static sizeof => 48
        static packingSize => 8

        /**
         * @type {Integer}
         */
        State {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {DEV_OBJECT}
         */
        DeviceObject{
            get {
                if(!this.HasProp("__DeviceObject"))
                    this.__DeviceObject := DEV_OBJECT(this.ptr + 0)
                return this.__DeviceObject
            }
        }
    
    }

    /**
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_DEV_QUERY_RESULT_UPDATE_PAYLOAD}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := %this.__Class%._DEV_QUERY_RESULT_UPDATE_PAYLOAD(this.ptr + 8)
            return this.__Data
        }
    }
}
