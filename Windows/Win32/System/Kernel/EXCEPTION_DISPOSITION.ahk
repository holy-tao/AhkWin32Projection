#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Kernel
 */
export default struct EXCEPTION_DISPOSITION {
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
    static ExceptionContinueExecution => 0

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionContinueSearch => 1

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionNestedException => 2

    /**
     * @type {Integer (Int32)}
     */
    static ExceptionCollidedUnwind => 3
}
