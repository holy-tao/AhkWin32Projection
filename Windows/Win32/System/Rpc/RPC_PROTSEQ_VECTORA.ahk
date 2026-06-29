#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 * @charset ANSI
 */
export default struct RPC_PROTSEQ_VECTORA {
    #StructPack 8

    Count : UInt32

    Protseq : IntPtr[1]

}
