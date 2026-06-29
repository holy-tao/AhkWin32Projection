#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GNSS_SUPL_CERT_ACTION.ahk" { GNSS_SUPL_CERT_ACTION }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * @namespace Windows.Win32.Devices.Geolocation
 */
export default struct GNSS_SUPL_CERT_CONFIG {
    #StructPack 4

    Size : UInt32

    Version : UInt32

    CertAction : GNSS_SUPL_CERT_ACTION

    SuplCertName : CHAR[260]

    CertSize : UInt32

    Unused : Int8[512]

    CertData : Int8[1]

}
