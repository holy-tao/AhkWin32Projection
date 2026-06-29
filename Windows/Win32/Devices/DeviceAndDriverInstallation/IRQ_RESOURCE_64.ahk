#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IRQ_DES_64.ahk" { IRQ_DES_64 }
#Import ".\IRQ_RANGE.ahk" { IRQ_RANGE }
#Import ".\IRQD_FLAGS.ahk" { IRQD_FLAGS }

/**
 * The IRQ_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes IRQ line usage for a device instance. (64 bit)
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_resource_64
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IRQ_RESOURCE_64 {
    #StructPack 8

    /**
     * An [IRQ_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-irq_des_32) structure.
     */
    IRQ_Header : IRQ_DES_64

    IRQ_Data : IRQ_RANGE[1]

}
