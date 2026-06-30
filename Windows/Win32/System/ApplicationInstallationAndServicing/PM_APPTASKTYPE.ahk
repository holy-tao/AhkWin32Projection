#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\PM_TASK_TYPE.ahk

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
class PM_APPTASKTYPE extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    ProductID {
        get {
            if(!this.HasProp("__ProductID"))
                this.__ProductID := Guid(0, this)
            return this.__ProductID
        }
    }

    /**
     * @type {PM_TASK_TYPE}
     */
    TaskType {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
