#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PROCESS_HANDLE_TRACING_ENABLE_EX {
    #StructPack 4

    Flags : UInt32

    TotalSlots : UInt32

}
