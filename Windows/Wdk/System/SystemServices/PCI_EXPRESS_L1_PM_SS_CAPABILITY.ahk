#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCI_EXPRESS_L1_PM_SS_CAPABILITY {
    #StructPack 8

    Header : IntPtr

    L1PmSsCapabilities : IntPtr

    L1PmSsControl1 : IntPtr

    L1PmSsControl2 : IntPtr

}
