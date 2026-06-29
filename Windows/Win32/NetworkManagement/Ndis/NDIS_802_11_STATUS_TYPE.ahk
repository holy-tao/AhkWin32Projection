#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_802_11_STATUS_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
