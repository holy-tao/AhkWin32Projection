#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DECRYPTION_STATUS_BUFFER {
    #StructPack 1

    NoEncryptedStreams : BOOLEAN

}
