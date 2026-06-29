#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
export default struct NDIS_CLASS_ID {
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
    static NdisClass802_3Priority => 0

    /**
     * @type {Integer (Int32)}
     */
    static NdisClassWirelessWanMbxMailbox => 1

    /**
     * @type {Integer (Int32)}
     */
    static NdisClassIrdaPacketInfo => 2

    /**
     * @type {Integer (Int32)}
     */
    static NdisClassAtmAALInfo => 3
}
