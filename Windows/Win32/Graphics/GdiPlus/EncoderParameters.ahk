#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\EncoderParameter.ahk" { EncoderParameter }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct EncoderParameters {
    #StructPack 8

    Count : UInt32

    Parameter : EncoderParameter[1]

}
