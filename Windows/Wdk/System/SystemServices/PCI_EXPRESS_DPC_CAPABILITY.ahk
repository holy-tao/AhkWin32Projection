#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_DPC_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    DpcCapabilities : IntPtr

    DpcControl : IntPtr

    DpcStatus : IntPtr

    DpcErrSrcId : IntPtr

    RpPioStatus : IntPtr

    RpPioMask : IntPtr

    RpPioSeverity : IntPtr

    RpPioSysError : IntPtr

    RpPioException : IntPtr

    RpPioHeaderLog : IntPtr

    RpPioImpSpecLog : IntPtr

    RpPioPrefixLog : IntPtr

}
