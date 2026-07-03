#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PIOMMU_DEVICE_FAULT_HANDLER.ahk" { PIOMMU_DEVICE_FAULT_HANDLER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_FAULT_CONFIGURATION {
    #StructPack 8

    FaultHandler : PIOMMU_DEVICE_FAULT_HANDLER

    FaultContext : IntPtr

}
