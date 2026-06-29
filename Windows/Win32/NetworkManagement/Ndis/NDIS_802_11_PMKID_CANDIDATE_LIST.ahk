#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PMKID_CANDIDATE.ahk" { PMKID_CANDIDATE }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_PMKID_CANDIDATE_LIST {
    #StructPack 4

    Version : UInt32

    NumCandidates : UInt32

    CandidateList : PMKID_CANDIDATE[1]

}
