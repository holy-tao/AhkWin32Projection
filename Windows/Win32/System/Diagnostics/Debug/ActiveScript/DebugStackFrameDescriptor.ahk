#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IDebugStackFrame.ahk" { IDebugStackFrame }
#Import "..\..\..\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct DebugStackFrameDescriptor {
    #StructPack 8

    pdsf : IDebugStackFrame

    dwMin : UInt32

    dwLim : UInt32

    fFinal : BOOL

    punkFinal : IUnknown

}
