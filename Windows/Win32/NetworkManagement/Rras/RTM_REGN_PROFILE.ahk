#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The RTM_REGN_PROFILE structure contains information returned during the registration process. The information is used for later function calls (such as the maximum number of routes that can be returned by a call to RtmGetEnumRoutes).
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_regn_profile
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_REGN_PROFILE {
    #StructPack 4

    /**
     * Specifies the maximum number of equal-cost next hops in a route.
     */
    MaxNextHopsInRoute : UInt32

    /**
     * Specifies the maximum number of handles that can be returned in one call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumdests">RtmGetEnumDests</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumroutes">RtmGetEnumRoutes</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetlistenumroutes">RtmGetListEnumRoutes</a>. The number of handles that can be returned is limited (and configurable) to improve efficiency and performance of the routing table manager.
     */
    MaxHandlesInEnum : UInt32

    /**
     * Views supported by this address family.
     */
    ViewsSupported : UInt32

    /**
     * Number of views.
     */
    NumberOfViews : UInt32

}
