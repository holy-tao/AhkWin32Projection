#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class I_RpcProxyCallbackInterface extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Pointer<I_RpcProxyIsValidMachineFn>}
     */
    IsValidMachineFn {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<I_RpcProxyGetClientAddressFn>}
     */
    GetClientAddressFn {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<I_RpcProxyGetConnectionTimeoutFn>}
     */
    GetConnectionTimeoutFn {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<I_RpcPerformCalloutFn>}
     */
    PerformCalloutFn {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<I_RpcFreeCalloutStateFn>}
     */
    FreeCalloutStateFn {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<I_RpcProxyGetClientSessionAndResourceUUID>}
     */
    GetClientSessionAndResourceUUIDFn {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<I_RpcProxyFilterIfFn>}
     */
    ProxyFilterIfFn {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<I_RpcProxyUpdatePerfCounterFn>}
     */
    RpcProxyUpdatePerfCounterFn {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer<I_RpcProxyUpdatePerfCounterBackendServerFn>}
     */
    RpcProxyUpdatePerfCounterBackendServerFn {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
