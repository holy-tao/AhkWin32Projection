#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEV_OBJECT.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\DEV_OBJECT_TYPE.ahk
#Include ..\Properties\DEVPROPERTY.ahk
#Include .\DEV_QUERY_STATE.ahk
#Include .\DEV_QUERY_RESULT_ACTION.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 */
class DEV_QUERY_RESULT_ACTION_DATA extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    class _DEV_QUERY_RESULT_UPDATE_PAYLOAD extends Win32Struct {
        static sizeof => 40
        static packingSize => 8

        /**
         * @type {DEV_QUERY_STATE}
         */
        State {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }

        /**
         * @type {DEV_OBJECT}
         */
        DeviceObject {
            get {
                if(!this.HasProp("__DeviceObject"))
                    this.__DeviceObject := DEV_OBJECT(0, this)
                return this.__DeviceObject
            }
        }
    }

    /**
     * @type {DEV_QUERY_RESULT_ACTION}
     */
    Action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {_DEV_QUERY_RESULT_UPDATE_PAYLOAD}
     */
    Data {
        get {
            if(!this.HasProp("__Data"))
                this.__Data := DEV_QUERY_RESULT_ACTION_DATA._DEV_QUERY_RESULT_UPDATE_PAYLOAD(8, this)
            return this.__Data
        }
    }
}
