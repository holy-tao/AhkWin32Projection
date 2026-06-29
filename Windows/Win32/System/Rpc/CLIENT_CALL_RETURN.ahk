#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct CLIENT_CALL_RETURN {
    #StructPack 8

    Pointer : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'Simple', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
