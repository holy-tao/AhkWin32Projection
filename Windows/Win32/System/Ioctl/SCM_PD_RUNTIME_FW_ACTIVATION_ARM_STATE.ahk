#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_RUNTIME_FW_ACTIVATION_ARM_STATE extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    ArmState{
        get {
            if(!this.HasProp("__ArmState"))
                this.__ArmState := BOOLEAN(this.ptr + 0)
            return this.__ArmState
        }
    }
}
