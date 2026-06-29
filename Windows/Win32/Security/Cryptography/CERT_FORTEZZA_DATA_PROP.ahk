#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_FORTEZZA_DATA_PROP {
    #StructPack 4

    SerialNumber : Int8[8]

    CertIndex : Int32

    CertLabel : Int8[36]

}
