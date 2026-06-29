#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security
 */
export default struct SYSTEM_AUDIT_OBJECT_ACE_FLAGS {
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
    static ACE_OBJECT_TYPE_PRESENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACE_INHERITED_OBJECT_TYPE_PRESENT => 2
}
