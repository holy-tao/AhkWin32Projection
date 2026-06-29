#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_PMKID_CANDIDATE_LIST {
    #StructPack 8

    Version : UInt32

    NumCandidates : UInt32

    CandidateList : IntPtr[1]

}
