#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.Memory
 */
export default struct SECTION_INHERIT {
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
    static ViewShare => 1

    /**
     * @type {Integer (Int32)}
     */
    static ViewUnmap => 2
}
