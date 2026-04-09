#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\VK_FPARAM.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 */
class VK_F extends Win32Struct {
    static sizeof => 132

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Vk {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NLSFEProcType {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {Integer}
     */
    NLSFEProcCurrent {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    NLSFEProcSwitch {
        get => NumGet(this, 3, "char")
        set => NumPut("char", value, this, 3)
    }

    /**
     * @type {VK_FPARAM}
     */
    NLSFEProc {
        get {
            if(!this.HasProp("__NLSFEProcProxyArray"))
                this.__NLSFEProcProxyArray := Win32FixedArray(this.ptr + 4, 8, VK_FPARAM, "")
            return this.__NLSFEProcProxyArray
        }
    }

    /**
     * @type {VK_FPARAM}
     */
    NLSFEProcAlt {
        get {
            if(!this.HasProp("__NLSFEProcAltProxyArray"))
                this.__NLSFEProcAltProxyArray := Win32FixedArray(this.ptr + 68, 8, VK_FPARAM, "")
            return this.__NLSFEProcAltProxyArray
        }
    }
}
