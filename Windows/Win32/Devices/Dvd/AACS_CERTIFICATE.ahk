#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct AACS_CERTIFICATE {
    #StructPack 1

    Nonce : Int8[20]

    Certificate : Int8[92]

}
