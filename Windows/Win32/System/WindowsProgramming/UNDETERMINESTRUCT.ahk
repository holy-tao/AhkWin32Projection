#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct UNDETERMINESTRUCT {
    #StructPack 4

    dwSize : UInt32

    uDefIMESize : UInt32

    uDefIMEPos : UInt32

    uUndetTextLen : UInt32

    uUndetTextPos : UInt32

    uUndetAttrPos : UInt32

    uCursorPos : UInt32

    uDeltaStart : UInt32

    uDetermineTextLen : UInt32

    uDetermineTextPos : UInt32

    uDetermineDelimPos : UInt32

    uYomiTextLen : UInt32

    uYomiTextPos : UInt32

    uYomiDelimPos : UInt32

}
