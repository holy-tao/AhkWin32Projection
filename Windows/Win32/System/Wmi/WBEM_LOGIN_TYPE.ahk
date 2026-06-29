#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_LOGIN_TYPE {
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
    static WBEM_FLAG_INPROC_LOGIN => 0

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_LOCAL_LOGIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_REMOTE_LOGIN => 2

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_AUTHENTICATION_METHOD_MASK => 15

    /**
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_USE_MULTIPLE_CHALLENGES => 16
}
