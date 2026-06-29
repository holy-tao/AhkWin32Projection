#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information related to an ongoing MDNS query. Your application must not modify its contents.
 * @remarks
 * This structure is for internal use only.
 * @see https://learn.microsoft.com/windows/win32/api/windns/ns-windns-mdns_query_handle
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
export default struct MDNS_QUERY_HANDLE {
    #StructPack 8

    /**
     * A value representing the queried name.
     */
    nameBuf : WCHAR[256]

    /**
     * A value representing the type of the query.
     */
    wType : UInt16

    /**
     * Reserved. Do not use.
     */
    pSubscription : IntPtr

    /**
     * Reserved. Do not use.
     */
    pWnfCallbackParams : IntPtr

    /**
     * Reserved. Do not use.
     */
    stateNameData : UInt32[2]

}
