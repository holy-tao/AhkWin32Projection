#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RPC_VERSION.ahk" { RPC_VERSION }
#Import ".\RPC_SYNTAX_IDENTIFIER.ahk" { RPC_SYNTAX_IDENTIFIER }
#Import ".\RPC_HTTP_REDIRECTOR_STAGE.ahk" { RPC_HTTP_REDIRECTOR_STAGE }
#Import ".\RPC_STATUS.ahk" { RPC_STATUS }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RDR_CALLOUT_STATE {
    #StructPack 8

    LastError : RPC_STATUS

    LastEEInfo : IntPtr

    LastCalledStage : RPC_HTTP_REDIRECTOR_STAGE

    ServerName : IntPtr

    ServerPort : IntPtr

    RemoteUser : IntPtr

    AuthType : IntPtr

    ResourceTypePresent : Int8

    SessionIdPresent : Int8

    InterfacePresent : Int8

    ResourceType : Guid

    SessionId : Guid

    Interface : RPC_SYNTAX_IDENTIFIER

    CertContext : IntPtr

}
