#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_SYNIC_EVENT_PARAMETERS {
    #StructPack 4

    VpIndex : UInt32

    TargetSint : Int8

    Reserved : Int8

    FlagNumber : UInt16

}
