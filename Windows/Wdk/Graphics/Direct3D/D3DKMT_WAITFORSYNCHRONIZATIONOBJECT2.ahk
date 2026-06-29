#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2 {
    #StructPack 8


    struct _Fence {
        FenceValue : Int64

    }

    hContext : UInt32

    ObjectCount : UInt32

    ObjectHandleArray : UInt32[32]

    Fence : D3DKMT_WAITFORSYNCHRONIZATIONOBJECT2._Fence

    static __New() {
        DefineProp(this.Prototype, 'Reserved', { type: Int64[8], offset: 136 })
        this.DeleteProp("__New")
    }
}
