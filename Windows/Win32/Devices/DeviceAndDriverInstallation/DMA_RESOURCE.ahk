#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DMA_DES.ahk
#Include .\DMA_RANGE.ahk

/**
 * The DMA_RESOURCE structure is used for specifying either a resource list or a resource requirements list that describes DMA channel usage for a device instance.
 * @see https://learn.microsoft.com/windows/win32/api/cfgmgr32/ns-cfgmgr32-dma_resource
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class DMA_RESOURCE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 1

    /**
     * A [DMA_DES](/windows/desktop/api/cfgmgr32/ns-cfgmgr32-dma_des) structure.
     * @type {DMA_DES}
     */
    DMA_Header{
        get {
            if(!this.HasProp("__DMA_Header"))
                this.__DMA_Header := DMA_DES(this.ptr + 0)
            return this.__DMA_Header
        }
    }

    /**
     * 
     * @type {Array<DMA_RANGE>}
     */
    DMA_Data{
        get {
            if(!this.HasProp("__DMA_DataProxyArray"))
                this.__DMA_DataProxyArray := Win32FixedArray(this.ptr + 16, 1, DMA_RANGE, "")
            return this.__DMA_DataProxyArray
        }
    }
}
