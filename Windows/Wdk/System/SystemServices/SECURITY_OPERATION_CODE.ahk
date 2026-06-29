#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct SECURITY_OPERATION_CODE {
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
    static SetSecurityDescriptor => 0

    /**
     * @type {Integer (Int32)}
     */
    static QuerySecurityDescriptor => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeleteSecurityDescriptor => 2

    /**
     * @type {Integer (Int32)}
     */
    static AssignSecurityDescriptor => 3
}
