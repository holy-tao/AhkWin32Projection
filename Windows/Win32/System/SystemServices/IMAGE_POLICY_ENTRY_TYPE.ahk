#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMAGE_POLICY_ENTRY_TYPE {
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
    static ImagePolicyEntryTypeNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeBool => 1

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeInt8 => 2

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeUInt8 => 3

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeInt16 => 4

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeUInt16 => 5

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeInt32 => 6

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeUInt32 => 7

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeInt64 => 8

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeUInt64 => 9

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeAnsiString => 10

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeUnicodeString => 11

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeOverride => 12

    /**
     * @type {Integer (Int32)}
     */
    static ImagePolicyEntryTypeMaximum => 13
}
