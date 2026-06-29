#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DXCore
 */
export default struct DXCoreWorkload {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static Graphics => 0

    /**
     * @type {Integer (UInt32)}
     */
    static Compute => 1

    /**
     * @type {Integer (UInt32)}
     */
    static Media => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MachineLearning => 3
}
