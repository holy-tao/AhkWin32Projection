#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Diagnostics\Etw\EVENT_TRACE_HEADER.ahk" { EVENT_TRACE_HEADER }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DXVA2TraceVideoProcessBltData {
    #StructPack 8

    wmiHeader : EVENT_TRACE_HEADER

    pObject : Int64

    pRenderTarget : Int64

    TargetFrameTime : Int64

    TargetRect : RECT

    Enter : BOOL

}
