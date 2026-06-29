#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorMethodImpl {
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
    static miCodeTypeMask => 3

    /**
     * @type {Integer (Int32)}
     */
    static miIL => 0

    /**
     * @type {Integer (Int32)}
     */
    static miNative => 1

    /**
     * @type {Integer (Int32)}
     */
    static miOPTIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static miRuntime => 3

    /**
     * @type {Integer (Int32)}
     */
    static miManagedMask => 4

    /**
     * @type {Integer (Int32)}
     */
    static miUnmanaged => 4

    /**
     * @type {Integer (Int32)}
     */
    static miManaged => 0

    /**
     * @type {Integer (Int32)}
     */
    static miForwardRef => 16

    /**
     * @type {Integer (Int32)}
     */
    static miPreserveSig => 128

    /**
     * @type {Integer (Int32)}
     */
    static miInternalCall => 4096

    /**
     * @type {Integer (Int32)}
     */
    static miSynchronized => 32

    /**
     * @type {Integer (Int32)}
     */
    static miNoInlining => 8

    /**
     * @type {Integer (Int32)}
     */
    static miAggressiveInlining => 256

    /**
     * @type {Integer (Int32)}
     */
    static miNoOptimization => 64

    /**
     * @type {Integer (Int32)}
     */
    static miSecurityMitigations => 1024

    /**
     * @type {Integer (Int32)}
     */
    static miUserMask => 5628

    /**
     * @type {Integer (Int32)}
     */
    static miMaxMethodImplVal => 65535
}
