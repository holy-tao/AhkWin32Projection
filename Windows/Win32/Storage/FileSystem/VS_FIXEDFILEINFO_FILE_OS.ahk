#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct VS_FIXEDFILEINFO_FILE_OS {
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
    static VOS_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_DOS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_OS216 => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_OS232 => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_NT => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_WINCE => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static VOS__BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VOS__WINDOWS16 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VOS__PM16 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VOS__PM32 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static VOS__WINDOWS32 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_DOS_WINDOWS16 => 65537

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_DOS_WINDOWS32 => 65540

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_OS216_PM16 => 131074

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_OS232_PM32 => 196611

    /**
     * @type {Integer (UInt32)}
     */
    static VOS_NT_WINDOWS32 => 262148
}
