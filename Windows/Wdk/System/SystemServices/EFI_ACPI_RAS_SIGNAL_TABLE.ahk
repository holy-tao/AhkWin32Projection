#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EFI_ACPI_RAS_SIGNAL_TABLE {
    #StructPack 8

    Header : IntPtr

    NumberRecord : UInt32

    Entries : IntPtr[1]

}
