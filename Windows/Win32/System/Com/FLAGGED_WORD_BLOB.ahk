#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct FLAGGED_WORD_BLOB {
    #StructPack 4

    fFlags : UInt32

    clSize : UInt32

    asData : UInt16[1]

}
