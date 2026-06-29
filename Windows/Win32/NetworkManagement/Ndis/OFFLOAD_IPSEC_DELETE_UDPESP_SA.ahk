#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct OFFLOAD_IPSEC_DELETE_UDPESP_SA {
    #StructPack 8

    OffloadHandle : HANDLE

    EncapTypeEntryOffldHandle : HANDLE

}
