#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct CallingConventionKind {
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
    static CallingConventionUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionCDecl => 1

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionFastCall => 2

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionStdCall => 3

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionSysCall => 4

    /**
     * @type {Integer (Int32)}
     */
    static CallingConventionThisCall => 5
}
