#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct ACCESS_MASKENUM {
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
    static PERM_EXCLUSIVE => 512

    /**
     * @type {Integer (Int32)}
     */
    static PERM_READDESIGN => 1024

    /**
     * @type {Integer (Int32)}
     */
    static PERM_WRITEDESIGN => 2048

    /**
     * @type {Integer (Int32)}
     */
    static PERM_WITHGRANT => 4096

    /**
     * @type {Integer (Int32)}
     */
    static PERM_REFERENCE => 8192

    /**
     * @type {Integer (Int32)}
     */
    static PERM_CREATE => 16384

    /**
     * @type {Integer (Int32)}
     */
    static PERM_INSERT => 32768

    /**
     * @type {Integer (Int32)}
     */
    static PERM_DELETE => 65536

    /**
     * @type {Integer (Int32)}
     */
    static PERM_READCONTROL => 131072

    /**
     * @type {Integer (Int32)}
     */
    static PERM_WRITEPERMISSIONS => 262144

    /**
     * @type {Integer (Int32)}
     */
    static PERM_WRITEOWNER => 524288

    /**
     * @type {Integer (Int32)}
     */
    static PERM_MAXIMUM_ALLOWED => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static PERM_ALL => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static PERM_EXECUTE => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static PERM_READ => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static PERM_UPDATE => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static PERM_DROP => 256
}
