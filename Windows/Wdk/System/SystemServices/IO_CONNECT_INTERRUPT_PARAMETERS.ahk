#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CONNECT_INTERRUPT_PARAMETERS {
    #StructPack 8

    Version : UInt32

    FullySpecified : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'LineBased', { type: IntPtr, offset: 8 })
        DefineProp(this.Prototype, 'MessageBased', { type: IntPtr, offset: 8 })
        this.DeleteProp("__New")
    }
}
