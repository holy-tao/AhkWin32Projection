#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_VERSION.ahk" { RPC_VERSION }
#Import ".\RPC_SYNTAX_IDENTIFIER.ahk" { RPC_SYNTAX_IDENTIFIER }
#Import ".\RPC_DISPATCH_TABLE.ahk" { RPC_DISPATCH_TABLE }
#Import ".\MIDL_INTERFACE_METHOD_PROPERTIES.ahk" { MIDL_INTERFACE_METHOD_PROPERTIES }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_SYNTAX_INFO {
    #StructPack 8

    TransferSyntax : RPC_SYNTAX_IDENTIFIER

    DispatchTable : RPC_DISPATCH_TABLE.Ptr

    ProcString : IntPtr

    FmtStringOffset : IntPtr

    TypeString : IntPtr

    aUserMarshalQuadruple : IntPtr

    pMethodProperties : MIDL_INTERFACE_METHOD_PROPERTIES.Ptr

    pReserved2 : IntPtr

}
