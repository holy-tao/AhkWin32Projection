#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_SYNTAX_IDENTIFIER.ahk" { RPC_SYNTAX_IDENTIFIER }

/**
 * The RPC_MESSAGE structure contains information shared between NDR and the rest of the RPC or OLE runtime.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdcep/ns-rpcdcep-rpc_message
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_MESSAGE {
    #StructPack 8

    /**
     * Reserved.
     */
    Handle : IntPtr

    /**
     * Data representation of the network buffer as defined by the NDR specification.
     */
    DataRepresentation : UInt32

    /**
     * Pointer to the beginning of the network buffer.
     */
    Buffer : IntPtr

    /**
     * Size, in bytes, of <b>Buffer</b>.
     */
    BufferLength : UInt32

    /**
     * Reserved.
     */
    ProcNum : UInt32

    /**
     * Reserved.
     */
    TransferSyntax : RPC_SYNTAX_IDENTIFIER.Ptr

    /**
     * Reserved.
     */
    RpcInterfaceInformation : IntPtr

    /**
     * Reserved.
     */
    ReservedForRuntime : IntPtr

    /**
     * Reserved.
     */
    ManagerEpv : IntPtr

    /**
     * Reserved.
     */
    ImportContext : IntPtr

    /**
     * Reserved.
     */
    RpcFlags : UInt32

}
