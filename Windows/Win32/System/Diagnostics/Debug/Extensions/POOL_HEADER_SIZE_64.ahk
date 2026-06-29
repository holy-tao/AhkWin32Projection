#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct POOL_HEADER_SIZE_64 {
    #StructPack 4

    UnsafePrevSize : Int8

    Unused1 : Int8

    UnsafeSize : Int8

    UnsafePoolType : Int8

    static __New() {
        DefineProp(this.Prototype, 'Ulong1', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
