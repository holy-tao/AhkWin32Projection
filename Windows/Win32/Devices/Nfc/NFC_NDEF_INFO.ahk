#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_NDEF_INFO {
    #StructPack 4

    fIsNdefFormatted : BOOLEAN

    fIsReadOnly : BOOLEAN

    dwActualMessageLength : UInt32

    dwMaxMessageLength : UInt32

}
