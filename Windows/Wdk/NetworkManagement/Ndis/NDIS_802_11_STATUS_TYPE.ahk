#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_STATUS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11StatusType_Authentication => 0

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11StatusType_MediaStreamMode => 1

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11StatusType_PMKID_CandidateList => 2

    /**
     * @type {Integer (Int32)}
     */
    static Ndis802_11StatusTypeMax => 3
}
