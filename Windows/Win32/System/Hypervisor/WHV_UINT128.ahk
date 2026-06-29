#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_UINT128 {
    #StructPack 8

    Low64 : Int64

    High64 : Int64

    static __New() {
        DefineProp(this.Prototype, 'Dword', { type: UInt32[4], offset: 0 })
        this.DeleteProp("__New")
    }
}
