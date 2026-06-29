#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct GET_INPUT_LINE {
    #StructPack 8

    Prompt : PSTR

    Buffer : PSTR

    BufferSize : UInt32

    InputSize : UInt32

}
