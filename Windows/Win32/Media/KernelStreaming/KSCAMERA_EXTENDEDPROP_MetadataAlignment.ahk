#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSCAMERA_EXTENDEDPROP_MetadataAlignment {
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
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_16 => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_32 => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_64 => 6

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_128 => 7

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_256 => 8

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_512 => 9

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_1024 => 10

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_2048 => 11

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_4096 => 12

    /**
     * @type {Integer (Int32)}
     */
    static KSCAMERA_EXTENDEDPROP_MetadataAlignment_8192 => 13
}
