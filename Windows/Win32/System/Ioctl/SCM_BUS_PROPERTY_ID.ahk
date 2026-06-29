#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SCM_BUS_PROPERTY_ID {
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
    static ScmBusProperty_RuntimeFwActivationInfo => 0

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_DedicatedMemoryInfo => 1

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_DedicatedMemoryState => 2

    /**
     * @type {Integer (Int32)}
     */
    static ScmBusProperty_Max => 3
}
