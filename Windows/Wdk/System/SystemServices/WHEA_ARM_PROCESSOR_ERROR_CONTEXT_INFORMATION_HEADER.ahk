#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_ARM_PROCESSOR_ERROR_CONTEXT_INFORMATION_HEADER {
    #StructPack 4

    Version : UInt16

    RegisterContextType : UInt16

    RegisterArraySize : UInt32

    RegisterArray : Int8[1]

}
