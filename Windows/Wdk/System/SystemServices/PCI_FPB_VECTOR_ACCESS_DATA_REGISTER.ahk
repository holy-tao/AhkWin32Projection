#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FPB_VECTOR_ACCESS_DATA_REGISTER {
    #StructPack 4

    VectorAccessData : UInt32

}
