#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_NI_USER_RESPONSE.ahk" { GNSS_NI_USER_RESPONSE }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_NI_RESPONSE {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    RequestId : UInt32

    UserResponse : GNSS_NI_USER_RESPONSE

}
