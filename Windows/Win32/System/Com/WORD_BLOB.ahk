#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct WORD_BLOB {
    #StructPack 4

    clSize : UInt32

    asData : UInt16[1]

}
