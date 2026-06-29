#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE.ahk" { IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DEVICE_CREATION_CONFIGURATION {
    #StructPack 8

    NextConfiguration : IntPtr

    ConfigType : IOMMU_DEVICE_CREATION_CONFIGURATION_TYPE

    Acpi : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'DeviceId', { type: IntPtr, offset: 16 })
        this.DeleteProp("__New")
    }
}
