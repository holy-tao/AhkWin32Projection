#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Power
 */
export default struct PROCESSOR_OBJECT_INFO_EX {
    #StructPack 4

    PhysicalID : UInt32

    PBlkAddress : UInt32

    PBlkLength : Int8

    InitialApicId : UInt32

}
