#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_EVENT_TYPE.ahk" { SECURE_ELEMENT_EVENT_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_EVENT_INFO {
    #StructPack 8

    hSecureElement : IntPtr

    eEventType : SECURE_ELEMENT_EVENT_TYPE

    cbEventData : UInt32

    pbEventData : Int8[1]

}
