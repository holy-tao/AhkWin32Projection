#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_RELEASE_TYPE.ahk" { NFC_RELEASE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_REMOTE_DEVICE_DISCONNET {
    #StructPack 8

    hRemoteDev : IntPtr

    eReleaseType : NFC_RELEASE_TYPE

}
