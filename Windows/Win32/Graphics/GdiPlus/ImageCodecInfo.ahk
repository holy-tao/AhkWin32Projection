#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ImageCodecInfo {
    #StructPack 8

    Clsid : Guid

    FormatID : Guid

    CodecName : PWSTR

    DllName : PWSTR

    FormatDescription : PWSTR

    FilenameExtension : PWSTR

    MimeType : PWSTR

    Flags : UInt32

    Version : UInt32

    SigCount : UInt32

    SigSize : UInt32

    SigPattern : IntPtr

    SigMask : IntPtr

}
