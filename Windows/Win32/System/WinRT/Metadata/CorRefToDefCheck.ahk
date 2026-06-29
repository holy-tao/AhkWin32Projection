#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 */
export default struct CorRefToDefCheck {
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
    static MDRefToDefDefault => 3

    /**
     * @type {Integer (Int32)}
     */
    static MDRefToDefAll => -1

    /**
     * @type {Integer (Int32)}
     */
    static MDRefToDefNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDTypeRefToDef => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDMemberRefToDef => 2
}
