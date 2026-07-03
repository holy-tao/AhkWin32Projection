#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WHEA_NOTIFICATION_DESCRIPTOR.ahk" { WHEA_NOTIFICATION_DESCRIPTOR }
#Import ".\WHEA_NOTIFICATION_FLAGS.ahk" { WHEA_NOTIFICATION_FLAGS }
#Import ".\WHEA_XPF_MC_BANK_DESCRIPTOR.ahk" { WHEA_XPF_MC_BANK_DESCRIPTOR }
#Import ".\XPF_MC_BANK_FLAGS.ahk" { XPF_MC_BANK_FLAGS }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_XPF_CMC_DESCRIPTOR {
    #StructPack 8

    Type : UInt16

    Enabled : BOOLEAN

    NumberOfBanks : Int8

    Reserved : UInt32

    Notify : WHEA_NOTIFICATION_DESCRIPTOR

    Banks : WHEA_XPF_MC_BANK_DESCRIPTOR[32]

}
