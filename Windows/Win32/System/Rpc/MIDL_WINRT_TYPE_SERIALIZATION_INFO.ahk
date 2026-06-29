#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDL_STUB_DESC.ahk" { MIDL_STUB_DESC }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_WINRT_TYPE_SERIALIZATION_INFO {
    #StructPack 8

    Version : UInt32

    TypeFormatString : IntPtr

    FormatStringSize : UInt16

    TypeOffset : UInt16

    StubDesc : MIDL_STUB_DESC.Ptr

}
