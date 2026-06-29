#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIE_CORRECTABLE_ERROR_SECTION {
    #StructPack 8

    Header : IntPtr

    Devices : IntPtr[1]

}
