#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIE_CORRECTABLE_ERROR_DEVICES {
    #StructPack 8

    ValidBits : IntPtr

    Address : IntPtr

    Mask : UInt32

    CorrectableErrorCount : UInt32[32]

}
