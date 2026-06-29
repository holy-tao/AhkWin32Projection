#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct QUAD {
    #StructPack 8

    UseThisFieldToCopy : Int64

    static __New() {
        DefineProp(this.Prototype, 'DoNotUseThisField', { type: Float64, offset: 0 })
        this.DeleteProp("__New")
    }
}
