#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ETW_CONTEXT_REGISTER_TYPES.ahk" { ETW_CONTEXT_REGISTER_TYPES }

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct TRACE_CONTEXT_REGISTER_INFO {
    #StructPack 4

    RegisterTypes : ETW_CONTEXT_REGISTER_TYPES

    Reserved : UInt32

}
