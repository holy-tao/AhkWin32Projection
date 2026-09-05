#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class SHCNE_ID extends Win32BitflagEnum {

    /**
     * Native name: SHCNE_RENAMEITEM
     * @type {Integer (UInt32)}
     */
    static RENAMEITEM => 1

    /**
     * Native name: SHCNE_CREATE
     * @type {Integer (UInt32)}
     */
    static CREATE => 2

    /**
     * Native name: SHCNE_DELETE
     * @type {Integer (UInt32)}
     */
    static DELETE => 4

    /**
     * Native name: SHCNE_MKDIR
     * @type {Integer (UInt32)}
     */
    static MKDIR => 8

    /**
     * Native name: SHCNE_RMDIR
     * @type {Integer (UInt32)}
     */
    static RMDIR => 16

    /**
     * Native name: SHCNE_MEDIAINSERTED
     * @type {Integer (UInt32)}
     */
    static MEDIAINSERTED => 32

    /**
     * Native name: SHCNE_MEDIAREMOVED
     * @type {Integer (UInt32)}
     */
    static MEDIAREMOVED => 64

    /**
     * Native name: SHCNE_DRIVEREMOVED
     * @type {Integer (UInt32)}
     */
    static DRIVEREMOVED => 128

    /**
     * Native name: SHCNE_DRIVEADD
     * @type {Integer (UInt32)}
     */
    static DRIVEADD => 256

    /**
     * Native name: SHCNE_NETSHARE
     * @type {Integer (UInt32)}
     */
    static NETSHARE => 512

    /**
     * Native name: SHCNE_NETUNSHARE
     * @type {Integer (UInt32)}
     */
    static NETUNSHARE => 1024

    /**
     * Native name: SHCNE_ATTRIBUTES
     * @type {Integer (UInt32)}
     */
    static ATTRIBUTES => 2048

    /**
     * Native name: SHCNE_UPDATEDIR
     * @type {Integer (UInt32)}
     */
    static UPDATEDIR => 4096

    /**
     * Native name: SHCNE_UPDATEITEM
     * @type {Integer (UInt32)}
     */
    static UPDATEITEM => 8192

    /**
     * Native name: SHCNE_SERVERDISCONNECT
     * @type {Integer (UInt32)}
     */
    static SERVERDISCONNECT => 16384

    /**
     * Native name: SHCNE_UPDATEIMAGE
     * @type {Integer (UInt32)}
     */
    static UPDATEIMAGE => 32768

    /**
     * Native name: SHCNE_DRIVEADDGUI
     * @type {Integer (UInt32)}
     */
    static DRIVEADDGUI => 65536

    /**
     * Native name: SHCNE_RENAMEFOLDER
     * @type {Integer (UInt32)}
     */
    static RENAMEFOLDER => 131072

    /**
     * Native name: SHCNE_FREESPACE
     * @type {Integer (UInt32)}
     */
    static FREESPACE => 262144

    /**
     * Native name: SHCNE_EXTENDED_EVENT
     * @type {Integer (UInt32)}
     */
    static EXTENDED_EVENT => 67108864

    /**
     * Native name: SHCNE_ASSOCCHANGED
     * @type {Integer (UInt32)}
     */
    static ASSOCCHANGED => 134217728

    /**
     * Native name: SHCNE_DISKEVENTS
     * @type {Integer (UInt32)}
     */
    static DISKEVENTS => 145439

    /**
     * Native name: SHCNE_GLOBALEVENTS
     * @type {Integer (UInt32)}
     */
    static GLOBALEVENTS => 201687520

    /**
     * Native name: SHCNE_ALLEVENTS
     * @type {Integer (UInt32)}
     */
    static ALLEVENTS => 2147483647

    /**
     * Native name: SHCNE_INTERRUPT
     * @type {Integer (UInt32)}
     */
    static INTERRUPT => 2147483648
}
