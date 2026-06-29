#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct STRINGEXSTRUCT {
    #StructPack 4

    dwSize : UInt32

    uDeterminePos : UInt32

    uDetermineDelimPos : UInt32

    uYomiPos : UInt32

    uYomiDelimPos : UInt32

}
