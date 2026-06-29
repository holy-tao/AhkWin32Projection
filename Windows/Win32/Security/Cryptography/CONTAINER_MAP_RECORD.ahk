#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CONTAINER_MAP_RECORD {
    #StructPack 2

    wszGuid : WCHAR[40]

    bFlags : Int8

    bReserved : Int8

    wSigKeySizeBits : UInt16

    wKeyExchangeKeySizeBits : UInt16

}
