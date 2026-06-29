#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct TXN_PARAMETER_BLOCK {
    #StructPack 8

    Length : UInt16

    TxFsContext : UInt16

    TransactionObject : IntPtr

}
