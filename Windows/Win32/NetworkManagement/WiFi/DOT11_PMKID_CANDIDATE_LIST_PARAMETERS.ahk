#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Ndis\NDIS_OBJECT_HEADER.ahk" { NDIS_OBJECT_HEADER }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_PMKID_CANDIDATE_LIST_PARAMETERS {
    #StructPack 4

    Header : NDIS_OBJECT_HEADER

    uCandidateListSize : UInt32

    uCandidateListOffset : UInt32

}
