#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct GET_CONTEXT_EX {
    #StructPack 8

    Status : UInt32

    ContextSize : UInt32

    pContext : IntPtr

}
