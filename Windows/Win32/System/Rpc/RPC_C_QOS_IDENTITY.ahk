#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The Security context is revised whenever the ModifiedId in the client's token is changed. All protocols use the ModifiedId (see note).
  * 
  * <b>Windows 2000:  </b>All remote protocols (all protocols other than <a href="https://docs.microsoft.com/windows/desktop/Midl/ncalrpc">ncalrpc</a>) use the AuthenticationID, also known as the LogonId, to track changes in the client's identity. The <b>ncalrpc</b> protocol uses  ModifiedId.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdce/ns-rpcdce-rpc_security_qos_v4_a
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_C_QOS_IDENTITY extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_IDENTITY_STATIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RPC_C_QOS_IDENTITY_DYNAMIC => 1
}
