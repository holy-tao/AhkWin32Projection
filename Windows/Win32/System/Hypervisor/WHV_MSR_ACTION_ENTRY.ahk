#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_MSR_ACTION_ENTRY {
    #StructPack 4

    Index : UInt32

    ReadAction : Int8

    WriteAction : Int8

    Reserved : UInt16

}
