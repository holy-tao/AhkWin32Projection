#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct STARTUPINFOW_FLAGS {
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
    static STARTF_FORCEONFEEDBACK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_FORCEOFFFEEDBACK => 128

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_PREVENTPINNING => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_RUNFULLSCREEN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_TITLEISAPPID => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_TITLEISLINKNAME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_UNTRUSTEDSOURCE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USECOUNTCHARS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USEFILLATTRIBUTE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USEHOTKEY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USEPOSITION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USESHOWWINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USESIZE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STARTF_USESTDHANDLES => 256
}
