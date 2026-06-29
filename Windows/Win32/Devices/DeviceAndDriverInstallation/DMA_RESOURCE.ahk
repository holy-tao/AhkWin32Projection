#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_RANGE.ahk" { DMA_RANGE }
#Import ".\DMA_DES.ahk" { DMA_DES }
#Import ".\DD_FLAGS.ahk" { DD_FLAGS }

/**
 * The DMA_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes DMA channel usage for a device instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-dma_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct DMA_RESOURCE {
    #StructPack 4

    /**
     * A [DMA_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-dma_des) structure.
     */
    DMA_Header : DMA_DES

    DMA_Data : DMA_RANGE[1]

}
