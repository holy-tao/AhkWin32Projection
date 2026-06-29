#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct IMPORT_OBJECT_NAME_TYPE {
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
    static IMPORT_OBJECT_ORDINAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME => 1

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME_NO_PREFIX => 2

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME_UNDECORATE => 3

    /**
     * @type {Integer (Int32)}
     */
    static IMPORT_OBJECT_NAME_EXPORTAS => 4
}
