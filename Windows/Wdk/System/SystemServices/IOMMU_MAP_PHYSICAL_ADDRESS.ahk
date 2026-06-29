#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\IOMMU_MAP_PHYSICAL_ADDRESS_TYPE.ahk" { IOMMU_MAP_PHYSICAL_ADDRESS_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IOMMU_MAP_PHYSICAL_ADDRESS {
    #StructPack 8


    struct _Mdl {
        Mdl : MDL.Ptr

    }

    struct _ContiguousRange {
        Base : Int64

        Size : IntPtr

    }

    struct _PfnArray {
        PageFrame : IntPtr

        NumberOfPages : IntPtr

    }

    MapType : IOMMU_MAP_PHYSICAL_ADDRESS_TYPE

    Mdl : IOMMU_MAP_PHYSICAL_ADDRESS._Mdl

    static __New() {
        DefineProp(this.Prototype, 'ContiguousRange', { type: IOMMU_MAP_PHYSICAL_ADDRESS._ContiguousRange, offset: 8 })
        DefineProp(this.Prototype, 'PfnArray', { type: IOMMU_MAP_PHYSICAL_ADDRESS._PfnArray, offset: 8 })
        this.DeleteProp("__New")
    }
}
