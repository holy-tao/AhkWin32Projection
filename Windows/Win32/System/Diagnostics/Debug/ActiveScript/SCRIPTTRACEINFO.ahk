#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct SCRIPTTRACEINFO {
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
    static SCRIPTTRACEINFO_SCRIPTSTART => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_SCRIPTEND => 1

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_COMCALLSTART => 2

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_COMCALLEND => 3

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_CREATEOBJSTART => 4

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_CREATEOBJEND => 5

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_GETOBJSTART => 6

    /**
     * @type {Integer (Int32)}
     */
    static SCRIPTTRACEINFO_GETOBJEND => 7
}
