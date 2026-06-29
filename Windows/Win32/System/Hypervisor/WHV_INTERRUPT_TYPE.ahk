#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_INTERRUPT_TYPE {
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
    static WHvX64InterruptTypeFixed => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeLowestPriority => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeNmi => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeInit => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeSipi => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64InterruptTypeLocalInt1 => 9
}
