#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_PROTSEQ_ENDPOINT {
    #StructPack 8

    RpcProtocolSequence : IntPtr

    Endpoint : IntPtr

}
