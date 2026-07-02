#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\I_RpcProxyFilterIfFn.ahk" { I_RpcProxyFilterIfFn }
#Import ".\I_RpcProxyGetClientAddressFn.ahk" { I_RpcProxyGetClientAddressFn }
#Import ".\I_RpcFreeCalloutStateFn.ahk" { I_RpcFreeCalloutStateFn }
#Import ".\I_RpcProxyUpdatePerfCounterBackendServerFn.ahk" { I_RpcProxyUpdatePerfCounterBackendServerFn }
#Import ".\I_RpcProxyIsValidMachineFn.ahk" { I_RpcProxyIsValidMachineFn }
#Import ".\I_RpcPerformCalloutFn.ahk" { I_RpcPerformCalloutFn }
#Import ".\I_RpcProxyUpdatePerfCounterFn.ahk" { I_RpcProxyUpdatePerfCounterFn }
#Import ".\I_RpcProxyGetConnectionTimeoutFn.ahk" { I_RpcProxyGetConnectionTimeoutFn }
#Import ".\I_RpcProxyGetClientSessionAndResourceUUID.ahk" { I_RpcProxyGetClientSessionAndResourceUUID }

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct I_RpcProxyCallbackInterface {
    #StructPack 8

    IsValidMachineFn : I_RpcProxyIsValidMachineFn

    GetClientAddressFn : I_RpcProxyGetClientAddressFn

    GetConnectionTimeoutFn : I_RpcProxyGetConnectionTimeoutFn

    PerformCalloutFn : I_RpcPerformCalloutFn

    FreeCalloutStateFn : I_RpcFreeCalloutStateFn

    GetClientSessionAndResourceUUIDFn : I_RpcProxyGetClientSessionAndResourceUUID

    ProxyFilterIfFn : I_RpcProxyFilterIfFn

    RpcProxyUpdatePerfCounterFn : I_RpcProxyUpdatePerfCounterFn

    RpcProxyUpdatePerfCounterBackendServerFn : I_RpcProxyUpdatePerfCounterBackendServerFn

}
