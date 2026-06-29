#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DMA_TRANSFER_INFO {
    #StructPack 8

    Version : UInt32

    V1 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'V2', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
