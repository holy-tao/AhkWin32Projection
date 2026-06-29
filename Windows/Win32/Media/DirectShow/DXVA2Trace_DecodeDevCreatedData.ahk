#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk" { EVENT_TRACE_HEADER }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2Trace_DecodeDevCreatedData {
    #StructPack 8

    wmiHeader : EVENT_TRACE_HEADER

    pObject : Int64

    pD3DDevice : Int64

    DeviceGuid : Guid

    Width : UInt32

    Height : UInt32

    Enter : BOOL

}
