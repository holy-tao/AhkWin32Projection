#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\RpcCallType.ahk" { RpcCallType }
#Import ".\RPC_CALL_LOCAL_ADDRESS_V1.ahk" { RPC_CALL_LOCAL_ADDRESS_V1 }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Rpc
 * @charset ANSI
 */
export default struct RPC_CALL_ATTRIBUTES_V3_A {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    ServerPrincipalNameBufferLength : UInt32

    ServerPrincipalName : IntPtr

    ClientPrincipalNameBufferLength : UInt32

    ClientPrincipalName : IntPtr

    AuthenticationLevel : UInt32

    AuthenticationService : UInt32

    NullSession : BOOL

    KernelModeCaller : BOOL

    ProtocolSequence : UInt32

    IsClientLocal : UInt32

    ClientPID : HANDLE

    CallStatus : UInt32

    CallType : RpcCallType

    CallLocalAddress : RPC_CALL_LOCAL_ADDRESS_V1.Ptr

    OpNum : UInt16

    InterfaceUuid : Guid

    ClientIdentifierBufferLength : UInt32

    ClientIdentifier : IntPtr

}
