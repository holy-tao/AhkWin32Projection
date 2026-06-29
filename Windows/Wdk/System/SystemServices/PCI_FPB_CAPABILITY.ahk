#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_FPB_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    CapabilitiesRegister : IntPtr

    RidVectorControl1Register : IntPtr

    RidVectorControl2Register : IntPtr

    MemLowVectorControlRegister : IntPtr

    MemHighVectorControl1Register : IntPtr

    MemHighVectorControl2Register : IntPtr

    VectorAccessControlRegister : IntPtr

    VectorAccessDataRegister : IntPtr

}
