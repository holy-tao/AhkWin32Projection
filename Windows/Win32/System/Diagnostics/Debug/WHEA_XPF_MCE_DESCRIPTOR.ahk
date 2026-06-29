#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XPF_MC_BANK_FLAGS.ahk" { XPF_MC_BANK_FLAGS }
#Import ".\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk" { WHEA_XPF_MC_BANK_DESCRIPTOR }
#Import ".\XPF_MCE_FLAGS.ahk" { XPF_MCE_FLAGS }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_XPF_MCE_DESCRIPTOR {
    #StructPack 8

    Type : UInt16

    Enabled : Int8

    NumberOfBanks : Int8

    Flags : XPF_MCE_FLAGS

    MCG_Capability : Int64

    MCG_GlobalControl : Int64

    Banks : WHEA_XPF_MC_BANK_DESCRIPTOR[32]

}
