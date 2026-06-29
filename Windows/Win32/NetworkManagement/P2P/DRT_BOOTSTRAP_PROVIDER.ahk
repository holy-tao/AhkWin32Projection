#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * DRT_BOOTSTRAP_PROVIDER structure defines the DRT interface that must be implemented by a bootstrap provider.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_bootstrap_provider
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_BOOTSTRAP_PROVIDER {
    #StructPack 8

    /**
     * Pointer to context data that is defined by the bootstrap resolver. When creating a bootstrap resolver, the developer  is required to populate the resolver with the required information; often times, this occurs as a "this" pointer.  This context gets passed to all the context parameters in the functions defined by the <b>DRT_BOOTSTRAP_PROVIDER</b>.
     */
    pvContext : IntPtr

    /**
     * Increments the count of references for the Bootstrap Provider with a set of DRTs.
     */
    Attach : IntPtr

    /**
     * Decrements the count of references for the Bootstrap Provider with a set of DRTs.
     */
    Detach : IntPtr

    /**
     * Called by the DRT infrastructure to supply configuration information about upcoming name resolutions.
     */
    InitResolve : IntPtr

    /**
     * Called by the DRT infrastructure to issue a resolution to determine the endpoints of nodes already active in the DRT cloud.
     */
    IssueResolve : IntPtr

    /**
     * Ends the resolution of an endpoint.
     */
    EndResolve : IntPtr

    /**
     * Registers an endpoint with the bootstrapping mechanism. This process makes it possible for other nodes  find the endpoint via the bootstrap resolver.
     */
    Register : IntPtr

    /**
     * This function deregisters an endpoint with the bootstrapping mechanism.  As a result, other nodes will be unable to find the local node via the bootstrap  resolver.
     */
    Unregister : IntPtr

}
