#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct AMD_L1_CACHE_INFO {
    #StructPack 4

    Ulong : UInt32

    static __New() {
        DefineProp(this.Prototype, 'LineSize', { type: Int8, offset: 0 })
        DefineProp(this.Prototype, 'LinesPerTag', { type: Int8, offset: 1 })
        DefineProp(this.Prototype, 'Associativity', { type: Int8, offset: 2 })
        DefineProp(this.Prototype, 'Size', { type: Int8, offset: 3 })
        this.DeleteProp("__New")
    }
}
