#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHCNE_ID {
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
    static SHCNE_RENAMEITEM => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_CREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_MKDIR => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_RMDIR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_MEDIAINSERTED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_MEDIAREMOVED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_DRIVEREMOVED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_DRIVEADD => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_NETSHARE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_NETUNSHARE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_ATTRIBUTES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_UPDATEDIR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_UPDATEITEM => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_SERVERDISCONNECT => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_UPDATEIMAGE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_DRIVEADDGUI => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_RENAMEFOLDER => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_FREESPACE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_EXTENDED_EVENT => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_ASSOCCHANGED => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_DISKEVENTS => 145439

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_GLOBALEVENTS => 201687520

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_ALLEVENTS => 2147483647

    /**
     * @type {Integer (UInt32)}
     */
    static SHCNE_INTERRUPT => 2147483648
}
