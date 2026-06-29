#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE.ahk" { D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION {
    #StructPack 8


    struct _Map {
        BaseAddress : Int64

        SizeInBytes : Int64

        hAllocation : UInt32

        AllocationOffsetInBytes : Int64

        AllocationSizeInBytes : Int64

    }

    struct _MapProtect {
        BaseAddress : Int64

        SizeInBytes : Int64

        hAllocation : UInt32

        AllocationOffsetInBytes : Int64

        AllocationSizeInBytes : Int64

        Protection : IntPtr

        DriverProtection : Int64

    }

    struct _Unmap {
        BaseAddress : Int64

        SizeInBytes : Int64

        Protection : IntPtr

    }

    struct _Copy {
        SourceAddress : Int64

        SizeInBytes : Int64

        DestAddress : Int64

    }

    OperationType : D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION_TYPE

    Map : D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._Map

    static __New() {
        DefineProp(this.Prototype, 'MapProtect', { type: D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._MapProtect, offset: 8 })
        DefineProp(this.Prototype, 'Unmap', { type: D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._Unmap, offset: 8 })
        DefineProp(this.Prototype, 'Copy', { type: D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION._Copy, offset: 8 })
        this.DeleteProp("__New")
    }
}
