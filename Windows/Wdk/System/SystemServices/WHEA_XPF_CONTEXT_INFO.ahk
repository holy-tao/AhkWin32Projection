#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_XPF_CONTEXT_INFO {
    #StructPack 8

    RegisterContextType : UInt16

    RegisterDataSize : UInt16

    MSRAddress : UInt32

    MmRegisterAddress : Int64

}
