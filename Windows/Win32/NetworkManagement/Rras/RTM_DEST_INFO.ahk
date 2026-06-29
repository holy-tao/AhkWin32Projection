#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\RTM_NET_ADDRESS.ahk" { RTM_NET_ADDRESS }

/**
 * The RTM_DEST_INFO structure is used to exchange destination information with clients registered with the routing table manager.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_dest_info
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RTM_DEST_INFO {
    #StructPack 8

    /**
     * Handle to the destination.
     */
    DestHandle : IntPtr

    /**
     * Specifies the destination network address as an address and a mask.
     */
    DestAddress : RTM_NET_ADDRESS

    /**
     * Specifies the last time this destination was updated.
     */
    LastChanged : FILETIME

    /**
     * Specifies the views to which this destination belongs.
     */
    BelongsToViews : UInt32

    /**
     * Indicates the number of ViewInfo structures present in this destination.
     */
    NumberOfViews : UInt32

    ViewId : Int32

    NumRoutes : UInt32

    Route : IntPtr

    Owner : IntPtr

    DestFlags : UInt32

    HoldRoute : IntPtr

}
