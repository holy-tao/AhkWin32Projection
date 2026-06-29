#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct GUIDELINE {
    #StructPack 4

    dwSize : UInt32

    dwLevel : UInt32

    dwIndex : UInt32

    dwStrLen : UInt32

    dwStrOffset : UInt32

    dwPrivateSize : UInt32

    dwPrivateOffset : UInt32

}
