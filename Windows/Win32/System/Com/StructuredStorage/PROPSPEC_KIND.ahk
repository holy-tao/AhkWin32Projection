#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct PROPSPEC_KIND {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static PRSPEC_LPWSTR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PRSPEC_PROPID => 1
}
