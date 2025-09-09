#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IRQ_DES_32.ahk
#Include .\IRQ_RANGE.ahk

/**
 * The IRQ_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes IRQ line usage for a device instance. (32 bit)
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_resource_32
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IRQ_RESOURCE_32 extends Win32Struct
{
    static sizeof => 28

    static packingSize => 1

    /**
     * An [IRQ_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-irq_des_32) structure.
     * @type {IRQ_DES_32}
     */
    IRQ_Header{
        get {
            if(!this.HasProp("__IRQ_Header"))
                this.__IRQ_Header := IRQ_DES_32(this.ptr + 0)
            return this.__IRQ_Header
        }
    }

    /**
     * 
     * @type {Array<IRQ_RANGE>}
     */
    IRQ_Data{
        get {
            if(!this.HasProp("__IRQ_DataProxyArray"))
                this.__IRQ_DataProxyArray := Win32FixedArray(this.ptr + 20, 1, IRQ_RANGE, "")
            return this.__IRQ_DataProxyArray
        }
    }
}
