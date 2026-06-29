#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KBUGCHECK_CALLBACK_REASON {
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
    static KbCallbackInvalid => 0

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackReserved1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackSecondaryDumpData => 2

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackDumpIo => 3

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackAddPages => 4

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackSecondaryMultiPartDumpData => 5

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackRemovePages => 6

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackTriageDumpData => 7

    /**
     * @type {Integer (Int32)}
     */
    static KbCallbackReserved2 => 8
}
