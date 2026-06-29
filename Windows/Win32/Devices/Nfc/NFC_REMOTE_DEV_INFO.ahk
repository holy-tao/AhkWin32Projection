#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_DEVICE_TYPE.ahk" { NFC_DEVICE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_REMOTE_DEV_INFO {
    #StructPack 8

    hRemoteDev : IntPtr

    eType : NFC_DEVICE_TYPE

    eRFTech : Int8

    eProtocol : Int8

    cbUid : Int8

    pbUid : Int8[16]

}
