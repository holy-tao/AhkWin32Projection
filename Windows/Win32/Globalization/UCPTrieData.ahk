#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Globalization
 */
export default struct UCPTrieData {
    #StructPack 8

    ptr0 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'ptr16', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ptr32', { type: IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'ptr8', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
