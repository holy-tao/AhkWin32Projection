#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Console
 */
export default struct ExtKeySubst {
    #StructPack 2

    wMod : UInt16

    wVirKey : UInt16

    wUnicodeChar : Int8

}
