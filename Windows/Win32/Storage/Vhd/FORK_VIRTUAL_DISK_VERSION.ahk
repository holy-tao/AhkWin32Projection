#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct FORK_VIRTUAL_DISK_VERSION {
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
    static FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static FORK_VIRTUAL_DISK_VERSION_1 => 1
}
