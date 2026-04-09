#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_TRANSLATE_GVA_RESULT_CODE.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
class WHV_TRANSLATE_GVA_RESULT extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {WHV_TRANSLATE_GVA_RESULT_CODE}
     */
    ResultCode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
