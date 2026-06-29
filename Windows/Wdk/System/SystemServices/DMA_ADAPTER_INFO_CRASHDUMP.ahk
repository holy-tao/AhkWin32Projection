#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_ADAPTER_INFO_CRASHDUMP {
    #StructPack 8

    DeviceDescription : IntPtr

    DeviceIdSize : IntPtr

    DeviceId : IntPtr

}
