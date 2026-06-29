#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct INLINE_FRAME_CONTEXT {
    #StructPack 4

    ContextValue : UInt32

    static __New() {
        DefineProp(this.Prototype, 'FrameId', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'FrameType', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'FrameSignature', { type: UInt16, offset: 2 })
        this.DeleteProp("__New")
    }
}
