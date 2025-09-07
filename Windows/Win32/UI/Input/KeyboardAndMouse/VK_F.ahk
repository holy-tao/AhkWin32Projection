#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\VK_FPARAM.ahk

/**
 * @namespace Windows.Win32.UI.Input.KeyboardAndMouse
 * @version v4.0.30319
 */
class VK_F extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

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
     * @type {Array<VK_FPARAM>}
     */
    NLSFEProc{
        get {
            if(!this.HasProp("__NLSFEProcProxyArray"))
                this.__NLSFEProcProxyArray := Win32FixedArray(this.ptr + 8, 8, VK_FPARAM, "")
            return this.__NLSFEProcProxyArray
        }
    }

    /**
     * @type {Array<VK_FPARAM>}
     */
    NLSFEProcAlt{
        get {
            if(!this.HasProp("__NLSFEProcAltProxyArray"))
                this.__NLSFEProcAltProxyArray := Win32FixedArray(this.ptr + 72, 8, VK_FPARAM, "")
            return this.__NLSFEProcAltProxyArray
        }
    }
}
