#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct HSE_TRACE_INFO {
    #StructPack 4

    fTraceRequest : BOOL

    TraceContextId : Int8[16]

    dwReserved1 : UInt32

    dwReserved2 : UInt32

}
