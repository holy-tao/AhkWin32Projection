#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PSHED_PLUGIN_DIMM_MISMATCH {
    #StructPack 8

    WheaEventLogEntry : IntPtr

    FirmwareBank : UInt16

    FirmwareCol : UInt16

    FirmwareRow : UInt16

    RetryRdBank : UInt16

    RetryRdCol : UInt16

    RetryRdRow : UInt16

    TaBank : UInt16

    TaCol : UInt16

    TaRow : UInt16

}
