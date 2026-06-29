#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct OUTPUTDUPL_CONTEXT_DEBUG_STATUS {
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
    static OUTPUTDUPL_CONTEXT_DEBUG_STATUS_INACTIVE => 0

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUTDUPL_CONTEXT_DEBUG_STATUS_ACTIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static OUTPUTDUPL_CONTEXT_DEBUG_STATUS_PENDING_DESTROY => 2
}
