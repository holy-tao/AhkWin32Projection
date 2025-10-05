#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_RUNTIME_FW_ACTIVATION_ARM_STATE extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * @type {Integer}
     */
    ArmState {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
