#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STACK_SRC_INFO.ahk" { STACK_SRC_INFO }
#Import "..\..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\DEBUG_STACK_FRAME_EX.ahk" { DEBUG_STACK_FRAME_EX }
#Import "..\..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct STACK_SYM_FRAME_INFO {
    #StructPack 8

    StackFrameEx : DEBUG_STACK_FRAME_EX

    SrcInfo : STACK_SRC_INFO

}
