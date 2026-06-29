#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DISPLAYID_DETAILED_TIMING_TYPE_I_SYNC_POLARITY {
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
    static DIDDT1_Sync_Positive => 0

    /**
     * @type {Integer (Int32)}
     */
    static DIDDT1_Sync_Negative => 1
}
