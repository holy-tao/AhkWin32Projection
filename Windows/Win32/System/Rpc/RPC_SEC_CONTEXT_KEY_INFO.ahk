#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_SEC_CONTEXT_KEY_INFO {
    #StructPack 4

    EncryptAlgorithm : UInt32

    KeySize : UInt32

    SignatureAlgorithm : UInt32

}
