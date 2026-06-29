#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ADVANCED_FEATURE_FLAGS {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_AUTO => 1

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_STATIC => 2

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_EMBEDDED => 4

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_FIXEDSIZE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_RECORD => 32

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_HAVEIID => 64

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_HAVEVARTYPE => 128

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_BSTR => 256

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_UNKNOWN => 512

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_DISPATCH => 1024

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_VARIANT => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static FADF_RESERVED => 61448
}
