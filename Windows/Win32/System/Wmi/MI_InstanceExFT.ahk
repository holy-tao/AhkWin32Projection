#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MI_InstanceFT.ahk

/**
 * Extends the MI_InstanceFT structure.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ns-mi-mi_instanceexft
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_InstanceExFT extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Parent <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instanceft">MI_InstanceFT</a> function table.
     * @type {MI_InstanceFT}
     */
    parent{
        get {
            if(!this.HasProp("__parent"))
                this.__parent := MI_InstanceFT(0, this)
            return this.__parent
        }
    }

    /**
     * Parses the structure and returns the 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/mi/ns-mi-mi_instanceft">MI_InstanceFT</a> function table. See 
     *        <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/mi/nf-mi-mi_instance_normalize">MI_Instance_Normalize</a>.
     * @type {Pointer}
     */
    Normalize {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }
}
