#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AACS_CERTIFICATE.ahk" { AACS_CERTIFICATE }

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct AACS_SEND_CERTIFICATE {
    #StructPack 4

    SessionId : UInt32

    Certificate : AACS_CERTIFICATE

}
