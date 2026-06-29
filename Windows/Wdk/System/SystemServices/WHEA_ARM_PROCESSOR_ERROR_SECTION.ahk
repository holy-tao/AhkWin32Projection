#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_PROCESSOR_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    ErrorInformationStructures : UInt16

    ContextInformationStructures : UInt16

    SectionLength : UInt32

    ErrorAffinityLevel : Int8

    Reserved : Int8[3]

    MPIDR_EL1 : Int64

    MIDR_EL1 : Int64

    RunningState : UInt32

    PSCIState : UInt32

    Data : Int8[1]

}
