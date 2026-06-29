#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RESOURCE_DISPLAY_TYPE {
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
    static RESOURCEDISPLAYTYPE_DOMAIN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_FILE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_GENERIC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_GROUP => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_SHARE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static RESOURCEDISPLAYTYPE_TREE => 10
}
