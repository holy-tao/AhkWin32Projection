#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct _CDBE_ACTIONS {
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
    static CDBE_TYPE_MUSIC => 1

    /**
     * @type {Integer (Int32)}
     */
    static CDBE_TYPE_DATA => 2

    /**
     * @type {Integer (Int32)}
     */
    static CDBE_TYPE_ALL => -1
}
