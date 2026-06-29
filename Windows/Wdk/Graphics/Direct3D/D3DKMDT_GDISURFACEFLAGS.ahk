#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_GDISURFACEFLAGS {
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
