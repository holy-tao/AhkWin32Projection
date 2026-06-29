#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RPC_DISPATCH_TABLE structure is part of the private interface between the run-time libraries and the stubs. Most distributed applications that use Microsoft RPC do not need this structure.
 * @see https://learn.microsoft.com/windows/win32/api/rpcdcep/ns-rpcdcep-rpc_dispatch_table
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_DISPATCH_TABLE {
    #StructPack 8

    DispatchTableCount : UInt32

    DispatchTable : IntPtr

    Reserved : IntPtr

}
