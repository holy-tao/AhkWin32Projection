#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_BINDING_VECTOR.ahk" { RPC_BINDING_VECTOR }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_IMPORT_CONTEXT_P {
    #StructPack 8

    LookupContext : IntPtr

    ProposedHandle : IntPtr

    Bindings : RPC_BINDING_VECTOR.Ptr

}
