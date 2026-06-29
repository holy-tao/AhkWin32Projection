#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XPF_MC_BANK_FLAGS.ahk" { XPF_MC_BANK_FLAGS }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct WHEA_XPF_MC_BANK_DESCRIPTOR {
    #StructPack 8

    BankNumber : Int8

    ClearOnInitialization : BOOLEAN

    StatusDataFormat : Int8

    Flags : XPF_MC_BANK_FLAGS

    ControlMsr : UInt32

    StatusMsr : UInt32

    AddressMsr : UInt32

    MiscMsr : UInt32

    ControlData : Int64

}
