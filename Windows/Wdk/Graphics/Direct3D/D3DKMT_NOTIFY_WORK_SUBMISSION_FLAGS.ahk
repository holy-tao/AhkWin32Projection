#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_NOTIFY_WORK_SUBMISSION_FLAGS {
    #StructPack 4

    /**
     * This bitfield backs the following members:
     * - Reserved
     */
    _bitfield : Int32

    static __New() {
        DefineProp(this.Prototype, 'Value', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
