#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IRQD_FLAGS.ahk" { IRQD_FLAGS }

/**
 * The IRQ_RANGE structure specifies a resource requirements list that describes IRQ line usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-irq_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct IRQ_RANGE {
    #StructPack 4

    /**
     * The lowest-numbered of a range of contiguous IRQ lines that can be allocated to the device.
     */
    IRQR_Min : UInt32

    /**
     * The highest-numbered of a range of contiguous IRQ lines that can be allocated to the device.
     */
    IRQR_Max : UInt32

    /**
     * One bit flag from [IRQ_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-irq_des_32) structure.
     */
    IRQR_Flags : IRQD_FLAGS

}
