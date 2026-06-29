#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_AGNSS_REQUEST_TYPE.ahk" { GNSS_AGNSS_REQUEST_TYPE }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_AGNSS_REQUEST_PARAM {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    RequestType : GNSS_AGNSS_REQUEST_TYPE

    BlobFormat : UInt32

}
