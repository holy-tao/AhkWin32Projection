#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSTER_CHANGE_SPACEPORT_V2 {
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
    static CLUSTER_CHANGE_SPACEPORT_CUSTOM_PNP_V2 => 1
}
