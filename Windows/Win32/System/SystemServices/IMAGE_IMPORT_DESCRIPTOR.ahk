#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_IMPORT_DESCRIPTOR {
    #StructPack 4

    Characteristics : UInt32

    TimeDateStamp : UInt32

    ForwarderChain : UInt32

    Name : UInt32

    FirstThunk : UInt32

    static __New() {
        DefineProp(this.Prototype, 'OriginalFirstThunk', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
