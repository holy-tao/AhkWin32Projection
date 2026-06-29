#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DEVICE_CREATION_CONFIGURATION_ACPI {
    #StructPack 4

    InputMappingBase : UInt32

    MappingsCount : UInt32

}
