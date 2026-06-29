#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct CANDIDATEINFO {
    #StructPack 4

    dwSize : UInt32

    dwCount : UInt32

    dwOffset : UInt32[32]

    dwPrivateSize : UInt32

    dwPrivateOffset : UInt32

}
