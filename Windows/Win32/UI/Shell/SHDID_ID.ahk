#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHDID_ID {
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
    static SHDID_ROOT_REGITEM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_FS_FILE => 2

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_FS_DIRECTORY => 3

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_FS_OTHER => 4

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_DRIVE35 => 5

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_DRIVE525 => 6

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_REMOVABLE => 7

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_FIXED => 8

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_NETDRIVE => 9

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_CDROM => 10

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_RAMDISK => 11

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_OTHER => 12

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_NET_DOMAIN => 13

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_NET_SERVER => 14

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_NET_SHARE => 15

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_NET_RESTOFNET => 16

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_NET_OTHER => 17

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_IMAGING => 18

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_AUDIO => 19

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_COMPUTER_SHAREDDOCS => 20

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_MOBILE_DEVICE => 21

    /**
     * @type {Integer (Int32)}
     */
    static SHDID_REMOTE_DESKTOP_DRIVE => 22
}
