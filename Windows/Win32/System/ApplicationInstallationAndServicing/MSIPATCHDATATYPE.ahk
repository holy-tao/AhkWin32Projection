#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct MSIPATCHDATATYPE {
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
    static MSIPATCH_DATATYPE_PATCHFILE => 0

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCH_DATATYPE_XMLPATH => 1

    /**
     * @type {Integer (Int32)}
     */
    static MSIPATCH_DATATYPE_XMLBLOB => 2
}
