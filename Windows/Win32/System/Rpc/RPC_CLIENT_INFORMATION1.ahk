#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_CLIENT_INFORMATION1 {
    #StructPack 8

    UserName : IntPtr

    ComputerName : IntPtr

    Privilege : UInt16

    AuthFlags : UInt32

}
