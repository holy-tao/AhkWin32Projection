#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WHV_X64_MSR_ACCESS_INFO.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_MSR_ACCESS_CONTEXT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {WHV_X64_MSR_ACCESS_INFO}
     */
    AccessInfo{
        get {
            if(!this.HasProp("__AccessInfo"))
                this.__AccessInfo := WHV_X64_MSR_ACCESS_INFO(0, this)
            return this.__AccessInfo
        }
    }

    /**
     * @type {Integer}
     */
    MsrNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Rax {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Rdx {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
