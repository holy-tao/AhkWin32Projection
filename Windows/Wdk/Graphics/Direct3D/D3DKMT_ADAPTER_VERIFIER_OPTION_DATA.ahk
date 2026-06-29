#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_ADAPTER_VERIFIER_OPTION_DATA {
    #StructPack 8

    VidMmFlags : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'VidMmTrimInterval', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
