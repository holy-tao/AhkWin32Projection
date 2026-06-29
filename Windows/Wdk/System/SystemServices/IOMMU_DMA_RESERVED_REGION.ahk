#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_DMA_RESERVED_REGION {
    #StructPack 8

    RegionNext : IOMMU_DMA_RESERVED_REGION.Ptr

    Base : Int64

    NumberOfPages : IntPtr

    ShouldMap : BOOLEAN

}
