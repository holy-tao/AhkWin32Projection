#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIDL_SYNTAX_INFO.ahk" { MIDL_SYNTAX_INFO }
#Import ".\RPC_SYNTAX_IDENTIFIER.ahk" { RPC_SYNTAX_IDENTIFIER }
#Import ".\MIDL_STUB_DESC.ahk" { MIDL_STUB_DESC }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_SERVER_INFO {
    #StructPack 8

    pStubDesc : MIDL_STUB_DESC.Ptr

    DispatchTable : IntPtr

    ProcString : IntPtr

    FmtStringOffset : IntPtr

    ThunkTable : IntPtr

    pTransferSyntax : RPC_SYNTAX_IDENTIFIER.Ptr

    nCount : IntPtr

    pSyntaxInfo : MIDL_SYNTAX_INFO.Ptr

}
