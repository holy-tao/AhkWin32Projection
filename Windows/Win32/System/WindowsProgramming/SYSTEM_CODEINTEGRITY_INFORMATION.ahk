#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct SYSTEM_CODEINTEGRITY_INFORMATION {
    #StructPack 4

    Length : UInt32

    CodeIntegrityOptions : UInt32

}
