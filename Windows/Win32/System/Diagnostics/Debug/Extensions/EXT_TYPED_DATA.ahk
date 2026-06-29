#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEBUG_TYPED_DATA.ahk" { DEBUG_TYPED_DATA }
#Import ".\EXT_TDOP.ahk" { EXT_TDOP }
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct EXT_TYPED_DATA {
    #StructPack 8

    Operation : EXT_TDOP

    Flags : UInt32

    InData : DEBUG_TYPED_DATA

    OutData : DEBUG_TYPED_DATA

    InStrIndex : UInt32

    In32 : UInt32

    Out32 : UInt32

    In64 : Int64

    Out64 : Int64

    StrBufferIndex : UInt32

    StrBufferChars : UInt32

    StrCharsNeeded : UInt32

    DataBufferIndex : UInt32

    DataBufferBytes : UInt32

    DataBytesNeeded : UInt32

    Status : HRESULT

    Reserved : Int64[8]

}
