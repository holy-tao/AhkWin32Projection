#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RTM_REGN_PROFILE structure contains information returned during the registration process. The information is used for later function calls (such as the maximum number of routes that can be returned by a call to RtmGetEnumRoutes).
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_regn_profile
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_REGN_PROFILE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the maximum number of equal-cost next hops in a route.
     * @type {Integer}
     */
    MaxNextHopsInRoute {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the maximum number of handles that can be returned in one call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumdests">RtmGetEnumDests</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetchangeddests">RtmGetChangedDests</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetenumroutes">RtmGetEnumRoutes</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/rtmv2/nf-rtmv2-rtmgetlistenumroutes">RtmGetListEnumRoutes</a>. The number of handles that can be returned is limited (and configurable) to improve efficiency and performance of the routing table manager.
     * @type {Integer}
     */
    MaxHandlesInEnum {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Views supported by this address family.
     * @type {Integer}
     */
    ViewsSupported {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of views.
     * @type {Integer}
     */
    NumberOfViews {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
