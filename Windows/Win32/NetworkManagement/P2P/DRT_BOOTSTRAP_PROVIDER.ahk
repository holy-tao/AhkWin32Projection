#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DRT_BOOTSTRAP_PROVIDER structure defines the DRT interface that must be implemented by a bootstrap provider.
 * @see https://docs.microsoft.com/windows/win32/api//drt/ns-drt-drt_bootstrap_provider
 * @namespace Windows.Win32.NetworkManagement.P2P
 * @version v4.0.30319
 */
class DRT_BOOTSTRAP_PROVIDER extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Pointer to context data that is defined by the bootstrap resolver. When creating a bootstrap resolver, the developer  is required to populate the resolver with the required information; often times, this occurs as a "this" pointer.  This context gets passed to all the context parameters in the functions defined by the <b>DRT_BOOTSTRAP_PROVIDER</b>.
     * @type {Pointer<Void>}
     */
    pvContext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Increments the count of references for the Bootstrap Provider with a set of DRTs.
     * @type {Pointer}
     */
    Attach {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Decrements the count of references for the Bootstrap Provider with a set of DRTs.
     * @type {Pointer}
     */
    Detach {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Called by the DRT infrastructure to supply configuration information about upcoming name resolutions.
     * @type {Pointer}
     */
    InitResolve {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Called by the DRT infrastructure to issue a resolution to determine the endpoints of nodes already active in the DRT cloud.
     * @type {Pointer}
     */
    IssueResolve {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Ends the resolution of an endpoint.
     * @type {Pointer}
     */
    EndResolve {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Registers an endpoint with the bootstrapping mechanism. This process makes it possible for other nodes  find the endpoint via the bootstrap resolver.
     * @type {Pointer}
     */
    Register {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * This function deregisters an endpoint with the bootstrapping mechanism.  As a result, other nodes will be unable to find the local node via the bootstrap  resolver.
     * @type {Pointer}
     */
    Unregister {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
