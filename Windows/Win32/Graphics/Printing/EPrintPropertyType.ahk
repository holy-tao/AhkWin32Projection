#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct EPrintPropertyType {
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
    static kPropertyTypeString => 1

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeInt32 => 2

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeInt64 => 3

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeByte => 4

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeTime => 5

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeDevMode => 6

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeSD => 7

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeNotificationReply => 8

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeNotificationOptions => 9

    /**
     * @type {Integer (Int32)}
     */
    static kPropertyTypeBuffer => 10
}
