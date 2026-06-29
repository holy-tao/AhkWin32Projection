#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_TABLE_REGISTER {
    #StructPack 8

    Pad : UInt16[3]

    Limit : UInt16

    Base : Int64

}
