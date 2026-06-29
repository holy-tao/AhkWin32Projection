#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IRQ_RANGE.ahk" { IRQ_RANGE }
#Import ".\IRQ_DES_32.ahk" { IRQ_DES_32 }
#Import ".\IRQD_FLAGS.ahk" { IRQD_FLAGS }

/**
 * The IRQ_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes IRQ line usage for a device instance. (32 bit)
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_resource_32
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IRQ_RESOURCE_32 {
    #StructPack 4

    /**
     * An [IRQ_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-irq_des_32) structure.
     */
    IRQ_Header : IRQ_DES_32

    IRQ_Data : IRQ_RANGE[1]

}
