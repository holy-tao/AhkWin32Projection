#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyCallbackInterface {
    #StructPack 8

    IsValidMachineFn : IntPtr

    GetClientAddressFn : IntPtr

    GetConnectionTimeoutFn : IntPtr

    PerformCalloutFn : IntPtr

    FreeCalloutStateFn : IntPtr

    GetClientSessionAndResourceUUIDFn : IntPtr

    ProxyFilterIfFn : IntPtr

    RpcProxyUpdatePerfCounterFn : IntPtr

    RpcProxyUpdatePerfCounterBackendServerFn : IntPtr

}
