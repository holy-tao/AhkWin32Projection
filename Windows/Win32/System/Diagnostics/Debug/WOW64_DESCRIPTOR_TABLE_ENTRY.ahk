#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WOW64_LDT_ENTRY.ahk" { WOW64_LDT_ENTRY }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WOW64_DESCRIPTOR_TABLE_ENTRY {
    #StructPack 4

    Selector : UInt32

    Descriptor : WOW64_LDT_ENTRY

}
