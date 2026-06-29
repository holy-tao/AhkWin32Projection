#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authorization
 */
export default struct AUTHZ_SECURITY_ATTRIBUTE_FLAGS {
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
    static AUTHZ_SECURITY_ATTRIBUTE_NON_INHERITABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static AUTHZ_SECURITY_ATTRIBUTE_VALUE_CASE_SENSITIVE => 2
}
