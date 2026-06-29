#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct NEGOTIATE_MESSAGES {
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
    static NegEnumPackagePrefixes => 0

    /**
     * @type {Integer (Int32)}
     */
    static NegGetCallerName => 1

    /**
     * @type {Integer (Int32)}
     */
    static NegTransferCredentials => 2

    /**
     * @type {Integer (Int32)}
     */
    static NegMsgReserved1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static NegCallPackageMax => 4
}
