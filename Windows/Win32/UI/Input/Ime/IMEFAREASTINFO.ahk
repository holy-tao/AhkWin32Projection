#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
export default struct IMEFAREASTINFO {
    #StructPack 4

    dwSize : UInt32

    dwType : UInt32

    dwData : UInt32[1]

}
