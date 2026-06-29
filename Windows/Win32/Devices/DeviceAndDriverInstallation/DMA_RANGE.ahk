#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DD_FLAGS.ahk" { DD_FLAGS }

/**
 * The DMA_RANGE structure specifies a resource requirements list that describes DMA channel usage for a device instance. For more information about resource requirements lists, see Hardware Resources.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-dma_range
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DMA_RANGE {
    #StructPack 4

    /**
     * The lowest-numbered DMA channel that can be allocated to the device.
     */
    DR_Min : UInt32

    /**
     * The highest-numbered DMA channel that can be allocated to the device.
     */
    DR_Max : UInt32

    /**
     * One bit flag from [DMA_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-dma_des) structure.
     */
    DR_Flags : DD_FLAGS

}
