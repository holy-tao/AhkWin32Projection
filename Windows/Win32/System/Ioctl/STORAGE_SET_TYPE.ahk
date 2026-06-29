#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_SET_TYPE {
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
    static PropertyStandardSet => 0

    /**
     * @type {Integer (Int32)}
     */
    static PropertyExistsSet => 1

    /**
     * @type {Integer (Int32)}
     */
    static PropertySetMaxDefined => 2
}
