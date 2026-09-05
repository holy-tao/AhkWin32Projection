#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHDID_ID extends Win32Enum {

    /**
     * Native name: SHDID_ROOT_REGITEM
     * @type {Integer (Int32)}
     */
    static ROOT_REGITEM => 1

    /**
     * Native name: SHDID_FS_FILE
     * @type {Integer (Int32)}
     */
    static FS_FILE => 2

    /**
     * Native name: SHDID_FS_DIRECTORY
     * @type {Integer (Int32)}
     */
    static FS_DIRECTORY => 3

    /**
     * Native name: SHDID_FS_OTHER
     * @type {Integer (Int32)}
     */
    static FS_OTHER => 4

    /**
     * Native name: SHDID_COMPUTER_DRIVE35
     * @type {Integer (Int32)}
     */
    static COMPUTER_DRIVE35 => 5

    /**
     * Native name: SHDID_COMPUTER_DRIVE525
     * @type {Integer (Int32)}
     */
    static COMPUTER_DRIVE525 => 6

    /**
     * Native name: SHDID_COMPUTER_REMOVABLE
     * @type {Integer (Int32)}
     */
    static COMPUTER_REMOVABLE => 7

    /**
     * Native name: SHDID_COMPUTER_FIXED
     * @type {Integer (Int32)}
     */
    static COMPUTER_FIXED => 8

    /**
     * Native name: SHDID_COMPUTER_NETDRIVE
     * @type {Integer (Int32)}
     */
    static COMPUTER_NETDRIVE => 9

    /**
     * Native name: SHDID_COMPUTER_CDROM
     * @type {Integer (Int32)}
     */
    static COMPUTER_CDROM => 10

    /**
     * Native name: SHDID_COMPUTER_RAMDISK
     * @type {Integer (Int32)}
     */
    static COMPUTER_RAMDISK => 11

    /**
     * Native name: SHDID_COMPUTER_OTHER
     * @type {Integer (Int32)}
     */
    static COMPUTER_OTHER => 12

    /**
     * Native name: SHDID_NET_DOMAIN
     * @type {Integer (Int32)}
     */
    static NET_DOMAIN => 13

    /**
     * Native name: SHDID_NET_SERVER
     * @type {Integer (Int32)}
     */
    static NET_SERVER => 14

    /**
     * Native name: SHDID_NET_SHARE
     * @type {Integer (Int32)}
     */
    static NET_SHARE => 15

    /**
     * Native name: SHDID_NET_RESTOFNET
     * @type {Integer (Int32)}
     */
    static NET_RESTOFNET => 16

    /**
     * Native name: SHDID_NET_OTHER
     * @type {Integer (Int32)}
     */
    static NET_OTHER => 17

    /**
     * Native name: SHDID_COMPUTER_IMAGING
     * @type {Integer (Int32)}
     */
    static COMPUTER_IMAGING => 18

    /**
     * Native name: SHDID_COMPUTER_AUDIO
     * @type {Integer (Int32)}
     */
    static COMPUTER_AUDIO => 19

    /**
     * Native name: SHDID_COMPUTER_SHAREDDOCS
     * @type {Integer (Int32)}
     */
    static COMPUTER_SHAREDDOCS => 20

    /**
     * Native name: SHDID_MOBILE_DEVICE
     * @type {Integer (Int32)}
     */
    static MOBILE_DEVICE => 21

    /**
     * Native name: SHDID_REMOTE_DESKTOP_DRIVE
     * @type {Integer (Int32)}
     */
    static REMOTE_DESKTOP_DRIVE => 22
}
