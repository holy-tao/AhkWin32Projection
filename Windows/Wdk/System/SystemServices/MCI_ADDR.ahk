#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct MCI_ADDR {
    #StructPack 8

    Address : UInt32

    Reserved : UInt32

    static __New() {
        DefineProp(this.Prototype, 'QuadPart', { type: Int64, offset: 0 })
        this.DeleteProp("__New")
    }
}
