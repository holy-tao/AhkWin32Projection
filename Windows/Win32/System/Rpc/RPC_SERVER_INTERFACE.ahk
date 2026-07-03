#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import ".\RPC_DISPATCH_TABLE.ahk" { RPC_DISPATCH_TABLE }
#Import ".\RPC_PROTSEQ_ENDPOINT.ahk" { RPC_PROTSEQ_ENDPOINT }
#Import ".\RPC_SYNTAX_IDENTIFIER.ahk" { RPC_SYNTAX_IDENTIFIER }
#Import ".\RPC_VERSION.ahk" { RPC_VERSION }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_SERVER_INTERFACE {
    #StructPack 8

    Length : UInt32

    InterfaceId : RPC_SYNTAX_IDENTIFIER

    TransferSyntax : RPC_SYNTAX_IDENTIFIER

    DispatchTable : RPC_DISPATCH_TABLE.Ptr

    RpcProtseqEndpointCount : UInt32

    RpcProtseqEndpoint : RPC_PROTSEQ_ENDPOINT.Ptr

    DefaultManagerEpv : IntPtr

    InterpreterInfo : IntPtr

    Flags : UInt32

}
