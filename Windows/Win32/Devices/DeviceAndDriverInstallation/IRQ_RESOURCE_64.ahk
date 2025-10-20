#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IRQ_DES_64.ahk
#Include .\IRQ_RANGE.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_resource_64
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class IRQ_RESOURCE_64 extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {IRQ_DES_64}
     */
    IRQ_Header{
        get {
            if(!this.HasProp("__IRQ_Header"))
                this.__IRQ_Header := IRQ_DES_64(0, this)
            return this.__IRQ_Header
        }
    }

    /**
     * @type {Array<IRQ_RANGE>}
     */
    IRQ_Data{
        get {
            if(!this.HasProp("__IRQ_DataProxyArray"))
                this.__IRQ_DataProxyArray := Win32FixedArray(this.ptr + 24, 1, IRQ_RANGE, "")
            return this.__IRQ_DataProxyArray
        }
    }
}
