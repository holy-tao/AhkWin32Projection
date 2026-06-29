#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct D3COLD_LAST_TRANSITION_STATUS {
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
    static LastDStateTransitionStatusUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static LastDStateTransitionD3hot => 1

    /**
     * @type {Integer (Int32)}
     */
    static LastDStateTransitionD3cold => 2
}
