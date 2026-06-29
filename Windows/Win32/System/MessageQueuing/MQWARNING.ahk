#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.MessageQueuing
 */
export default struct MQWARNING {
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
    static MQ_INFORMATION_PROPERTY => 1074659329

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_ILLEGAL_PROPERTY => 1074659330

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_PROPERTY_IGNORED => 1074659331

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_UNSUPPORTED_PROPERTY => 1074659332

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_DUPLICATE_PROPERTY => 1074659333

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_OPERATION_PENDING => 1074659334

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_FORMATNAME_BUFFER_TOO_SMALL => 1074659337

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_INTERNAL_USER_CERT_EXIST => 1074659338

    /**
     * @type {Integer (Int32)}
     */
    static MQ_INFORMATION_OWNER_IGNORED => 1074659339
}
