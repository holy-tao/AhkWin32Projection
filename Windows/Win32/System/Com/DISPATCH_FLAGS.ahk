#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct DISPATCH_FLAGS {
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
    static DISPATCH_METHOD => 1

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_PROPERTYGET => 2

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_PROPERTYPUT => 4

    /**
     * @type {Integer (UInt16)}
     */
    static DISPATCH_PROPERTYPUTREF => 8
}
