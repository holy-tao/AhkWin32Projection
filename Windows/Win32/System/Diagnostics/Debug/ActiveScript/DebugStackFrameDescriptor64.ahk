#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDebugStackFrame.ahk" { IDebugStackFrame }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct DebugStackFrameDescriptor64 {
    #StructPack 8

    pdsf : IDebugStackFrame

    dwMin : Int64

    dwLim : Int64

    fFinal : BOOL

    punkFinal : IUnknown

}
