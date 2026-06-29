#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct PROCESSOR_IDLESTATE_INFO {
    #StructPack 4

    TimeCheck : UInt32

    DemotePercent : Int8

    PromotePercent : Int8

    Spare : Int8[2]

}
