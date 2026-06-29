#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct ACE_REVISION {
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
    static ACL_REVISION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACL_REVISION_DS => 4
}
