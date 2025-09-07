#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DEV_OBJECT.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceQuery
 * @version v4.0.30319
 */
class DEV_QUERY_RESULT_ACTION_DATA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Action {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {DEV_OBJECT}
     */
    DeviceObject{
        get {
            if(!this.HasProp("__DeviceObject"))
                this.__DeviceObject := DEV_OBJECT(this.ptr + 8)
            return this.__DeviceObject
        }
    }
}
