#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
export default struct AACS_CHALLENGE_KEY {
    #StructPack 1

    EllipticCurvePoint : Int8[40]

    Signature : Int8[40]

}
