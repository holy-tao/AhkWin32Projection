#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_SCHEDULINGPRIORITYCLASS {
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
    static D3DKMT_SCHEDULINGPRIORITYCLASS_IDLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_BELOW_NORMAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_NORMAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_ABOVE_NORMAL => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_HIGH => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_SCHEDULINGPRIORITYCLASS_REALTIME => 5
}
