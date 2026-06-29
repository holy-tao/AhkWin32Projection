#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct msidbFileAttributes {
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
    static msidbFileAttributesReadOnly => 1

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesHidden => 2

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesSystem => 4

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesReserved0 => 8

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesIsolatedComp => 16

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesReserved1 => 64

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesReserved2 => 128

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesReserved3 => 256

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesVital => 512

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesChecksum => 1024

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesPatchAdded => 4096

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesNoncompressed => 8192

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesCompressed => 16384

    /**
     * @type {Integer (Int32)}
     */
    static msidbFileAttributesReserved4 => 32768
}
