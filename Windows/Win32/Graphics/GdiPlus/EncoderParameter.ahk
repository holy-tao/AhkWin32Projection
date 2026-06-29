#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct EncoderParameter {
    #StructPack 8

    Guid : Guid

    NumberOfValues : UInt32

    Type : UInt32

    Value : IntPtr

}
