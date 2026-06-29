#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct WDBGEXTS_DISASSEMBLE_BUFFER {
    #StructPack 8

    InOffset : Int64

    OutOffset : Int64

    AddrFlags : UInt32

    FormatFlags : UInt32

    DataBufferBytes : UInt32

    DisasmBufferChars : UInt32

    DataBuffer : IntPtr

    DisasmBuffer : PWSTR

    Reserved0 : Int64[3]

}
