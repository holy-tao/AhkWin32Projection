#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_X64_APIC_SMI_CONTEXT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ApicIcr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
