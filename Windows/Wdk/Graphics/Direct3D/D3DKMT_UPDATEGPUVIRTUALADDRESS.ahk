#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION.ahk" { D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_UPDATEGPUVIRTUALADDRESS {
    #StructPack 8


    struct _Flags {
        /**
         * This bitfield backs the following members:
         * - DoNotWait
         * - Reserved
         */
        _bitfield : Int32


        /**
         * @type {Integer}
         */
        DoNotWait {
            get => (this._bitfield >> 0) & 0x1
            set => this._bitfield := ((value & 0x1) << 0) | (this._bitfield & ~(0x1 << 0))
        }
        static __New() {
            DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    hDevice : UInt32

    hContext : UInt32

    hFenceObject : UInt32

    NumOperations : UInt32

    Operations : D3DDDI_UPDATEGPUVIRTUALADDRESS_OPERATION.Ptr

    Reserved0 : IntPtr

    Reserved1 : Int64

    FenceValue : Int64

    Flags : D3DKMT_UPDATEGPUVIRTUALADDRESS._Flags

}
