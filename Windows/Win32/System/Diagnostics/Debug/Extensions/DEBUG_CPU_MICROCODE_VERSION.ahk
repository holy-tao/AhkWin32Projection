#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DEBUG_CPU_MICROCODE_VERSION {
    #StructPack 8

    SizeOfStruct : UInt32

    CachedSignature : Int64

    InitialSignature : Int64

    ProcessorModel : UInt32

    ProcessorFamily : UInt32

    ProcessorStepping : UInt32

    ProcessorArchRev : UInt32

}
