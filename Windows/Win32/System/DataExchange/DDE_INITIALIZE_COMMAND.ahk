#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DataExchange
 */
export default struct DDE_INITIALIZE_COMMAND {
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
    static APPCLASS_MONITOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APPCLASS_STANDARD => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPCMD_CLIENTONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static APPCMD_FILTERINITS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_ALLSVRXACTIONS => 258048

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_ADVISES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_CONNECTIONS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_EXECUTES => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_POKES => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_REQUESTS => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_FAIL_SELFCONNECTIONS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_SKIP_ALLNOTIFICATIONS => 3932160

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_SKIP_CONNECT_CONFIRMS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_SKIP_DISCONNECTS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_SKIP_REGISTRATIONS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CBF_SKIP_UNREGISTRATIONS => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CALLBACKS => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static MF_CONV => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static MF_ERRORS => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static MF_HSZ_INFO => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static MF_LINKS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static MF_POSTMSGS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static MF_SENDMSGS => 33554432
}
