#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorAttributeTargets {
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
    static catAssembly => 1

    /**
     * @type {Integer (Int32)}
     */
    static catModule => 2

    /**
     * @type {Integer (Int32)}
     */
    static catClass => 4

    /**
     * @type {Integer (Int32)}
     */
    static catStruct => 8

    /**
     * @type {Integer (Int32)}
     */
    static catEnum => 16

    /**
     * @type {Integer (Int32)}
     */
    static catConstructor => 32

    /**
     * @type {Integer (Int32)}
     */
    static catMethod => 64

    /**
     * @type {Integer (Int32)}
     */
    static catProperty => 128

    /**
     * @type {Integer (Int32)}
     */
    static catField => 256

    /**
     * @type {Integer (Int32)}
     */
    static catEvent => 512

    /**
     * @type {Integer (Int32)}
     */
    static catInterface => 1024

    /**
     * @type {Integer (Int32)}
     */
    static catParameter => 2048

    /**
     * @type {Integer (Int32)}
     */
    static catDelegate => 4096

    /**
     * @type {Integer (Int32)}
     */
    static catGenericParameter => 16384

    /**
     * @type {Integer (Int32)}
     */
    static catAll => 24575

    /**
     * @type {Integer (Int32)}
     */
    static catClassMembers => 6140
}
