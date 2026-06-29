#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_CERT_CONFIG_ENTRY.ahk" { HTTP_CERT_CONFIG_ENTRY }

/**
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_CERT_CONFIG_PARAM {
    #StructPack 8

    CertConfigCount : UInt32

    CertConfigs : HTTP_CERT_CONFIG_ENTRY.Ptr

}
