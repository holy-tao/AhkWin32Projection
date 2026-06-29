#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * HCN_PORT_ACCESS
 * @see https://learn.microsoft.com/virtualization/api/hcn/Reference/HCN_PORT_ACCESS
 * @namespace Windows.Win32.System.HostComputeNetwork
 */
export default struct HCN_PORT_ACCESS {
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
    static HCN_PORT_ACCESS_EXCLUSIVE => 1

    /**
     * @type {Integer (Int32)}
     */
    static HCN_PORT_ACCESS_SHARED => 2
}
