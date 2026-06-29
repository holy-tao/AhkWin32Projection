#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_PROC_FORMAT {
    #StructPack 4

    Flags : UInt32

    StackSize : UInt32

    ConstantClientBufferSize : UInt32

    ConstantServerBufferSize : UInt32

    RpcFlags : UInt16

    FloatDoubleMask : UInt16

    NumberOfParams : UInt16

    ExtensionSize : UInt16

}
