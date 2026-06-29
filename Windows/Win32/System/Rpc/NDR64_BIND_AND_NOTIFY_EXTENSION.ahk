#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDR64_BIND_CONTEXT.ahk" { NDR64_BIND_CONTEXT }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_BIND_AND_NOTIFY_EXTENSION {
    #StructPack 2

    Binding : NDR64_BIND_CONTEXT

    NotifyIndex : UInt16

}
