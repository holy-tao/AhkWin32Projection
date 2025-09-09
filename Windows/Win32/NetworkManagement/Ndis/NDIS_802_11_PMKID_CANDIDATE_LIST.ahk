#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\PMKID_CANDIDATE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_802_11_PMKID_CANDIDATE_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NumCandidates {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<PMKID_CANDIDATE>}
     */
    CandidateList{
        get {
            if(!this.HasProp("__CandidateListProxyArray"))
                this.__CandidateListProxyArray := Win32FixedArray(this.ptr + 8, 1, PMKID_CANDIDATE, "")
            return this.__CandidateListProxyArray
        }
    }
}
