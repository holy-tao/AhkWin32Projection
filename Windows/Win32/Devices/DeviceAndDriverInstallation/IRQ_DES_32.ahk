#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_des_32
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IRQ_DES_32 extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    IRQD_Count {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    IRQD_Type {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    IRQD_Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IRQD_Alloc_Num {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    IRQD_Affinity {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
