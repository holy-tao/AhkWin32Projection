#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CONTEXT.ahk" { CONTEXT }
#Import ".\IMAGE_RUNTIME_FUNCTION_ENTRY.ahk" { IMAGE_RUNTIME_FUNCTION_ENTRY }
#Import ".\UNWIND_HISTORY_TABLE.ahk" { UNWIND_HISTORY_TABLE }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @architecture X64
 */
export default struct DISPATCHER_CONTEXT {
    #StructPack 8

    ControlPc : Int64

    ImageBase : Int64

    FunctionEntry : IMAGE_RUNTIME_FUNCTION_ENTRY.Ptr

    EstablisherFrame : Int64

    TargetIp : Int64

    ContextRecord : CONTEXT.Ptr

    LanguageHandler : IntPtr

    HandlerData : IntPtr

    HistoryTable : UNWIND_HISTORY_TABLE.Ptr

    ScopeIndex : UInt32

    Fill0 : UInt32

}
