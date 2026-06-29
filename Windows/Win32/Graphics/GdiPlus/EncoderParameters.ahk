#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EncoderParameter.ahk" { EncoderParameter }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct EncoderParameters {
    #StructPack 8

    Count : UInt32

    Parameter : EncoderParameter[1]

}
